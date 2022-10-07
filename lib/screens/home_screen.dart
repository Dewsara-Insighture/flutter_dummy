import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/screens/user_detail_screen.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../widgets/user_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// need for future builder
  // late Future<List<User>?> _userList;

  final List<User> _lUsers = [
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
  late List<User> _filteredUsers = [];
  late List<User>? _apiUsers = [];

  late Future<List<User>?> _userList;

  String searchString = "";

  void _getData() async {
    _apiUsers = (await ApiService().getUsers());
    if (_apiUsers != null) {
      print(_apiUsers);
      setState(() {
        _filteredUsers = _apiUsers!;
      });
    } else {
      print('broke');
    }
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    //Correctly working
    // if (_filteredUsers.isEmpty) {
    //   _getData();
    // }

    //State Check with Provider  Seems we do not need to use this. But still keep.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });

    super.initState();
  }

  void filterUserList(String keyword) {
    List<User> result = [];

    if (keyword.isEmpty) {
      result = _apiUsers!;
    } else {
      result = _apiUsers!
          .where(
              (user) => user.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      searchString = keyword;
      _filteredUsers = result;
    });
  }

  Future refresh() async {
    // Provider.of<UserProvider>(context).refreshUsers();
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
                    onChanged: (value) {
                      Provider.of<UserProvider>(context, listen: false)
                          .changeSearchString(value);
                      // filterUserList(value);
                    },
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
                // Future builder is best to use when we do not have a search and only data will be displayed. Because the list is captured using snapshot.data
                // FutureBuilder(
                //   future: _userList,
                //   builder:
                //       (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //     print(snapshot.data);
                //     if (snapshot.hasData) {
                //       return ListView.builder(
                //         shrinkWrap: true,
                //         physics: const NeverScrollableScrollPhysics(),
                //         itemCount: snapshot.data.length,
                //         itemBuilder: ((context, index) {
                //           return OpenContainer(
                //             closedColor: Colors.transparent,
                //             closedElevation: 0,
                //             openColor: Colors.transparent,
                //             transitionType: ContainerTransitionType.fade,
                //             transitionDuration:
                //                 const Duration(seconds: 1, milliseconds: 30),
                //             openBuilder: (context, _) => UserDetailScreen(
                //                 userDet: snapshot.data?[index]),
                //             closedBuilder:
                //                 (context, VoidCallback openContainer) =>
                //                     UserCard(
                //               user: snapshot.data?[index],
                //               onClicked: openContainer,
                //             ),
                //           );
                //         }),
                //       );
                //     } else if (snapshot.hasError) {
                //       return Text('Some Error Occured');
                //     }
                //     return CircularProgressIndicator();
                //   },
                // )

                //Correctly Working.
                // _filteredUsers.isEmpty
                // ? Padding(
                //     padding: const EdgeInsets.only(top: 80),
                //     child: Center(
                //       child: Transform.scale(
                //         scale: 1.8,
                //         child: const CircularProgressIndicator(
                //             valueColor:
                //                 AlwaysStoppedAnimation<Color>(Colors.grey)),
                //       ),
                //     ),
                //   )
                // : ListView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: _filteredUsers.length,
                //     itemBuilder: ((context, index) {
                //       return OpenContainer(
                //         closedColor: Colors.transparent,
                //         closedElevation: 0,
                //         openColor: Colors.transparent,
                //         transitionType: ContainerTransitionType.fade,
                //         transitionDuration:
                //             const Duration(seconds: 1, milliseconds: 30),
                //         openBuilder: (context, _) => UserDetailScreen(
                //             userDet: _filteredUsers[index]),
                //         closedBuilder:
                //             (context, VoidCallback openContainer) =>
                //                 UserCard(
                //           user: _filteredUsers[index],
                //           onClicked: openContainer,
                //         ),
                //       );
                //     }),
                //   )

                Consumer<UserProvider>(
                  builder: (context, value, child) {
                    print(value.filUserList);
                    final users = value.filUserList;
                    if (value.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Center(
                          child: Transform.scale(
                            scale: 1.8,
                            child: const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.grey)),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: users.length,
                      itemBuilder: ((context, index) {
                        return OpenContainer(
                          closedColor: Colors.transparent,
                          closedElevation: 0,
                          openColor: Colors.transparent,
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration:
                              const Duration(seconds: 1, milliseconds: 30),
                          openBuilder: (context, _) =>
                              UserDetailScreen(userDet: users.elementAt(index)),
                          closedBuilder:
                              (context, VoidCallback openContainer) => UserCard(
                            user: users.elementAt(index),
                            onClicked: openContainer,
                          ),
                        );
                      }),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
