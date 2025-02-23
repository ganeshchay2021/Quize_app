import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/result/result_screen.dart';
import 'package:quiz_app/pages/widgets/custom_backbutton.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> question = [];
  int currentIndex = 0, score = 0;
  int? selectedOption;
  bool hasAnswered = false, isLoading = true;

  Future<void> _fetchQuestion() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("ListOfQuestions")
          .doc(widget.category)
          .get();

      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null && data.containsKey("Questions")) {
          var questionMap = data["Questions"];
          if (questionMap is Map<String, dynamic>) {
            var fetchQuestions = questionMap.entries.map(
              (entry) {
                var q = entry.value;
                var optionsMap = q["options"] as Map<String, dynamic>;
                var optionsList = optionsMap.entries.toList()
                  ..sort(
                    (a, b) => int.parse(a.key).compareTo(
                      int.parse(b.key),
                    ),
                  ); //sorted by key
                var options =
                    optionsList.map((e) => e.value.toString()).toList();
                return {
                  "questionsText": q['questionsText'] ?? "No questions",
                  "options": options,
                  "correctOptionKey":
                      int.tryParse(q["correctOptionKey"].toString()) ?? 0,
                };
              },
            ).toList();
            fetchQuestions.shuffle(Random());
            if (fetchQuestions.length > 20) {
              fetchQuestions = fetchQuestions.sublist(0, 20);
            }
            setState(() {
              question = fetchQuestions;
            });
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _checkCorrectAns(int index) {
    setState(() {
      hasAnswered = true;
      selectedOption = index;
      if (question[currentIndex]["correctOptionKey"] == index + 1) {
        score++;
      }
    });
  }

  Future<void> _nextQuestion() async {
    if (currentIndex < question.length - 1) {
      setState(() {
        hasAnswered = false;
        selectedOption = null;
        currentIndex++;
      });
    } else {
      // await _updateUserScore();
      Navigator.pushReplacement(context, CupertinoPageRoute(builder:(context) => ResultScreen(score: score, totalQuestion: question.length,),));
    }
  }

  Future<void> _updateUserScore() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }  


    try {
      var userRef =
          FirebaseFirestore.instance.collection("userData").doc(user.uid);
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        var snapshot = await transaction.get(userRef);

        if (snapshot.exists) {
          int existingScore = snapshot["score"] ?? 0;
          transaction.update(userRef, {"score": existingScore + score});
        }
      });
    } catch (e) {
      debugPrint("error update score $e");
    }
  }

  @override
  void initState() {
    _fetchQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (question.isNotEmpty) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (currentIndex + 1) / question.length,
                color: Colors.green,
                minHeight: 8,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        offset: const Offset(0, 4))
                  ],
                ),
                child: UiHelper.customText(
                  text: "${question[currentIndex]["questionsText"]}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return _buildOption(index);
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 18,
                      );
                    },
                    itemCount: question[currentIndex]["options"].length),
              ),
              //condition render next and finish buttton
              if (hasAnswered)
                CustomButton(
                    btnName:
                        currentIndex == question.length - 1 ? "Finish" : "Next",
                    btnColor: Colors.deepPurple,
                    horizontalMargin: 100,
                    onTap: _nextQuestion)
                    , const SizedBox(height: 200,),
            ],
          ),
        ),
      );
    }

    if (question.isEmpty) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: Center(
          child: UiHelper.customText(
              text: "No Questions available",
              fontSize: 20,
              textAlign: TextAlign.center),
        ),
      );
    }
    return const Placeholder();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      leading: CustomBackbutton(
          color: Colors.white,
          onTap: () {
            Navigator.pop(context);
          }),
      centerTitle: true,
      title: UiHelper.customText(
        text: "${widget.category} (${currentIndex + 1}/ ${question.length})",
        color: Colors.white,
      ),
    );
  }

  Widget _buildOption(int index) {
    // ignore: unrelated_type_equality_checks
    bool isCorrect = question[currentIndex]["correctOptionKey"] == index + 1;
    bool isSelected = selectedOption == index;
    Color bgColor = hasAnswered
        ? (isCorrect
            ? Colors.green.shade300
            : isSelected
                ? Colors.red.shade300
                : Colors.grey.shade200)
        : Colors.grey.shade200;

    Color textColor =
        hasAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black;

    return InkWell(
      onTap: hasAnswered ? null : () => _checkCorrectAns(index),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 4,
                  offset: const Offset(0, 2)),
            ]),
        child: UiHelper.customText(
          text: "${question[currentIndex]['options'][index]}",
          fontSize: 15,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
