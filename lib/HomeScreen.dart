import 'package:edu_track/DashboardScreen.dart';
import 'package:edu_track/ProfileScreen.dart';
import 'package:edu_track/ProgramScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> enrolledCourses = [];

  final List<Widget> pages = [
    DashboardScreen(),
    ProgramScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        selectedItemColor: Color(0xff0D1C2E),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Program"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}