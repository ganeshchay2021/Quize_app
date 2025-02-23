// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';
import 'package:quiz_app/pages/bottomNavBar/bottom_nav_bar.dart';
import 'package:quiz_app/pages/widgets/custom_button.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestion;
  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestion,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  
  Future<void> apdateUserScore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    try {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection("userData").doc(user.uid);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(userRef);
        if (snapshot.exists) {
          int existingScore = snapshot['score'] ?? 0;
          transaction.update(userRef, {"score": existingScore + widget.score});
        } else {
          throw Exception("User does not exit");
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  @override
  void initState() {
    apdateUserScore();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: UiHelper.customText(
          text: "Result",
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Lottie.network(
                  "https://lottie.host/80d5e438-49cb-4bcb-a9a3-d499eff5f97f/8clWBPj3IO.json",
                  height: 100,
                  width: 300,
                  fit: BoxFit.cover),
              Lottie.network(
                  "https://lottie.host/57484f30-1f9c-4afe-9472-56dc91369165/NfQBHspeWY.json",
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover),
              Lottie.network(
                  "https://lottie.host/57484f30-1f9c-4afe-9472-56dc91369165/NfQBHspeWY.json",
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          UiHelper.customText(
            text: "Quize Completed",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          UiHelper.customText(
              text: "Your score ${widget.score} out of ${widget.totalQuestion}", fontSize: 22),
          //calculate the persentage
          UiHelper.customText(
              text: "${(widget.score / widget.totalQuestion * 100).toStringAsFixed(2)}%",
              fontSize: 22),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  btnName: "Start new quiz",
                  btnColor: Colors.deepPurple,
                  horizontalMargin: 5,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  btnName: "Your Ranking",
                  btnColor: Colors.deepPurple,
                  horizontalMargin: 5,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const BottomNavBar(
                          initiIndex: 1,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
