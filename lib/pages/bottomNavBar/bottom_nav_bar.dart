// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/category/category_screen.dart';
import 'package:quiz_app/pages/leaderboard/leaderboard_screen.dart';
import 'package:quiz_app/pages/profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int initiIndex;
  const BottomNavBar({
    super.key,
    this.initiIndex = 0,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> pages = const [
    CategoryScreen(),
    LeaderboardScreen(),
    ProfileScreen()
  ];
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.initiIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        iconSize: 35,
        selectedFontSize: 17,
        unselectedFontSize: 15,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: "Leaderboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
