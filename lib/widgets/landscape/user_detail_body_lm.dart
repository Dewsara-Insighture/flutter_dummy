import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../review_card.dart';
import '../stat_card.dart';

class UserDetailBodyLandscape extends StatelessWidget {
  final User user;
  const UserDetailBodyLandscape({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const ReviewCard();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
