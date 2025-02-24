import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/domain/constant/assets.dart';
import 'package:quiz_app/domain/constant/ui_helper.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  Stream<List<Map<String, dynamic>>> getLeaderBoardData() {
    return FirebaseFirestore.instance
        .collection("userData")
        .orderBy("score", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: getLeaderBoardData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final user = snapshot.data!;

          if (user.isEmpty) {
            return Center(
              child: UiHelper.customText(
                text: "No Users found yet",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            );
          }

          final topThreeUser = user.take(3).toList();
          final remainingUser = user.skip(3).toList();

          return Column(
            children: [
              Stack(
                children: [
                  UiHelper.assetsImage(
                    image: Assets.leaderBoard,
                    height: 450,
                    width: double.maxFinite,
                    boxFit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 70,
                      left: 150,
                      right: 150,
                      child: InkWell(
                        onTap: () {
                          print(remainingUser);
                        },
                        child: UiHelper.customText(
                            text: "Leaderboard",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  if (topThreeUser.isNotEmpty)
                    Positioned(
                        top: 150,
                        left: 50,
                        right: 50,
                        child: _buildTopUser(topThreeUser[0], 1, context)),
                  if (topThreeUser.length >= 2)
                    Positioned(
                        top: 220,
                        left: 30,
                        child: _buildTopUser(topThreeUser[1], 2, context)),
                  if (topThreeUser.length >= 3)
                    Positioned(
                        top: 240,
                        right: 40,
                        child: _buildTopUser(topThreeUser[2], 3, context)),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: remainingUser.length,
                  itemBuilder: (context, index) {
                    final user = remainingUser[index];
                    final rank = index + 4;
                    return _buildRemainingUser(user, rank);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopUser(
      Map<String, dynamic> user, int rank, BuildContext contex) {
    String name = user["name"];
    String firstName = name.split(' ')[0];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: rank == 1 ? 50 : 40,
            backgroundImage: user["profile"] != null
                ? MemoryImage(base64Decode(user["profile"]))
                : null,
            child: user["profile"] == null
                ? const Icon(
                    Icons.person,
                    size: 50,
                  )
                : null,
          ),
          const SizedBox(
            height: 10,
          ),
          UiHelper.customText(
              text: firstName,
              fontWeight: FontWeight.w600,
              fontSize: rank == 1 ? 20 : 18),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiHelper.customText(text: "👍", fontSize: 19),
                const SizedBox(
                  width: 5,
                ),
                UiHelper.customText(
                    text: user["score"].toString(),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRemainingUser(Map<String, dynamic> user, int rank) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
    
        children: [
          UiHelper.customText(text: rank.toString(), fontSize: 18),
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: user["profile"] != null
                ? MemoryImage(base64Decode(user["profile"]))
                : null,
            child: user["profile"] == null
                ? const Icon(
                    Icons.person,
                    size: 30,
                  )
                : null,
          ),
          const SizedBox(
            width: 15,
          ),
          UiHelper.customText(text: user["name"], fontSize: 16, fontWeight: FontWeight.w600),
          const Spacer(),
          Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiHelper.customText(text: "👍", fontSize: 14),
                const SizedBox(
                  width: 5,
                ),
                UiHelper.customText(
                    text: user["score"].toString(),
                    fontWeight: FontWeight.bold,
                    fontSize: 13)
              ],
            ),
          )
        ],
      ),
    );
  }
}
