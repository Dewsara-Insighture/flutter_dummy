import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/company_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List page = [
    HomeScreen(),
    const CompanyScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(
              label: 'Company', icon: Icon(Icons.business_rounded)),
          BottomNavigationBarItem(
              label: 'Profile', icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }
}
