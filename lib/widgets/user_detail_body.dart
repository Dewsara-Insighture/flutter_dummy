import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/widgets/review_card.dart';
import 'package:flutter_application_1/widgets/stat_card.dart';

class UserDetailBody extends StatelessWidget {
  final User user;
  const UserDetailBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Profile Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Team Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        user.teamName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Contact Number ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        user.contactNo,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Stats',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.grey[800]?.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.add,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: StatusCard(
                          cardText: "Favourite",
                          cardColor: (Colors.red[200])!,
                          cardIcon: (Icon(
                            Icons.favorite_rounded,
                            color: Colors.red[700],
                          )),
                          count: '2'),
                    ),
                    Expanded(
                      child: StatusCard(
                          cardText: "Reviews",
                          cardColor: (Colors.blue[100])!,
                          cardIcon: (Icon(
                            Icons.rate_review_rounded,
                            color: Colors.blue[700],
                          )),
                          count: '2'),
                    ),
                    Expanded(
                      child: StatusCard(
                          cardText: "Achievements",
                          cardColor: (Colors.orange[200])!,
                          cardIcon: (Icon(
                            Icons.star_rate_rounded,
                            color: (Colors.orange[700]),
                          )),
                          count: '2'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                ReviewCard(),
                // ListView.builder(
                //     itemCount: 4,
                //     itemBuilder: (context, index) {
                //       return const ReviewCard();
                //     })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
