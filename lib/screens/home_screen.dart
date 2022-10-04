import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_application_1/screens/user_detail_screen.dart';
import 'package:flutter_application_1/widgets/search_widget.dart';
import 'dart:convert';

import '../models/user.dart';
import '../widgets/user_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  var jsonObj = {
  List<User> lUsers = [
    User(
      name: 'Alex Wasabi',
      position: "Senior Software Engineer",
      avatarImg: "asset/images/male_user_1.jpg",
      teamName: 'Purple',
      email: 'alexwas2@gmail.com',
      contactNo: '0771239863',
    ),
    User(
      name: 'Jhordan Pawel',
      position: "Associate Software Engineer",
      avatarImg: "asset/images/male_user_2.png",
      teamName: 'Scorpion',
      email: 'jPawel1993@gmail.com',
      contactNo: '0771234863',
    ),
    User(
      name: 'Shyam Raju',
      position: "Project Manager",
      avatarImg: "asset/images/male_user_3.png",
      teamName: 'Red Lion',
      email: 'shyamraj@yahoo.com',
      contactNo: '0771238653',
    ),
    User(
      name: 'Cristina Cris',
      position: "UI/UX Engineer ",
      avatarImg: "asset/images/female_user_1.jpg",
      teamName: 'Sentinels',
      email: 'cristinacris@hotmail.com',
      contactNo: '0714235663',
    ),
    User(
      name: 'Ethan Noah',
      position: "Intern Developer",
      avatarImg: "asset/images/male_user_1.jpg",
      teamName: '100 Thieves',
      email: 'noah456@gmail.com',
      contactNo: '0721239444',
    ),
    User(
      name: 'Mila Anastasia',
      position: "Associate Project Manager",
      avatarImg: "asset/images/female_user_2.jpg",
      teamName: 'Purple',
      email: 'anastami3@outlook.com',
      contactNo: '0701764863',
    ),
    User(
      name: 'Justin Kolender',
      position: "Tech Lead ",
      avatarImg: "asset/images/male_user_3.png",
      teamName: 'Sentinels',
      email: 'justinlender32@gmail.com',
      contactNo: '0771294710',
    ),
    User(
      name: 'Shane White',
      position: "Data Analyst",
      avatarImg: "asset/images/male_user_1.jpg",
      teamName: 'Scorpion',
      email: 'white889@gmail.com',
      contactNo: '0957302863',
    ),
  ];

  List<User> filteredUsers = [];

  @override
  void initState() {
    filteredUsers = lUsers;
    super.initState();
  }

  void filterUserList(String keyword) {
    List<User> result = [];

    if (keyword.isEmpty) {
      result = lUsers;
    } else {
      result = lUsers
          .where(
              (user) => user.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredUsers = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome\nHanna!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Know your Employees Better.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey[400]?.withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 32.5,
                          backgroundColor: Colors.grey[400]?.withOpacity(0.6),
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("asset/images/female_user_1.jpg"),
                            radius: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                  child: TextField(
                    onChanged: (value) => filterUserList(value),
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.grey[100],
                      prefixIcon: const Icon(Icons.search_rounded),
                      hintText: 'Search by Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                const Text(
                  "Employee List",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                for (var val in filteredUsers)
                  OpenContainer(
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openColor: Colors.transparent,
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration:
                        const Duration(seconds: 1, milliseconds: 30),
                    openBuilder: (context, _) => UserDetailScreen(userDet: val),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        UserCard(
                      user: val,
                      onClicked: openContainer,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
