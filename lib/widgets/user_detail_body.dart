import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/widgets/add_review_popup.dart';
import 'package:flutter_application_1/widgets/review_card.dart';
import 'package:flutter_application_1/widgets/stat_card.dart';
import 'package:like_button/like_button.dart';

class UserDetailBody extends StatefulWidget {
  final User user;
  const UserDetailBody({super.key, required this.user});

  @override
  State<UserDetailBody> createState() => _UserDetailBodyState();
}

class _UserDetailBodyState extends State<UserDetailBody> {
  bool isLiked = false;
  var favCount = 2;

  @override
  Widget build(BuildContext context) {
    // Future<bool> onLikeButtonTapped(bool isLiked) async {
    //   favCount += isLiked ? 1 : -1;
    //   setState(() => {favCount += 1});

    //   return !isLiked;
    // }

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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Profile Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    LikeButton(
                      isLiked: isLiked,
                      onTap: (isLiked) async {
                        this.isLiked = !isLiked;
                        setState(() {
                          favCount += this.isLiked ? 1 : -1;
                        });
                        return !isLiked;
                      },
                    )
                  ],
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
                        widget.user.email,
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
                        widget.user.teamName,
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
                        widget.user.contactNo,
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddReviewPopup();
                                });
                            // Navigator.pushNamed(context, '/home');
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
                      //     child: Card(
                      //   color: Colors.red[200],
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(12.0),
                      //     child: Column(
                      //       children: [
                      //         LikeButton(
                      //           size: 25,
                      //           countPostion: CountPostion.bottom,
                      //           likeCount: favCount,
                      //           likeCountPadding: const EdgeInsets.all(0),
                      //           likeBuilder: (isLiked) {
                      //             return Icon(
                      //               Icons.favorite_rounded,
                      //               color: isLiked
                      //                   ? Colors.red[700]
                      //                   : Colors.red[400],
                      //               size: 25,
                      //             );
                      //           },
                      //           countBuilder: (likeCount, isLiked, text) {
                      //             return (Text(
                      //               '$favCount',
                      //               style: const TextStyle(
                      //                   color: Colors.white,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.bold),
                      //             ));
                      //           },
                      //         ),
                      //         const Text(
                      //           'Favourite',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               overflow: TextOverflow.ellipsis,
                      //               fontSize: 12,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                      child: StatusCard(
                          cardText: "Favourite",
                          cardColor: (Colors.red[200])!,
                          cardIcon: (Icon(
                            Icons.favorite_rounded,
                            color: Colors.red[700],
                          )),
                          count: favCount),
                    ),
                    Expanded(
                      child: StatusCard(
                          cardText: "Reviews",
                          cardColor: (Colors.blue[100])!,
                          cardIcon: (Icon(
                            Icons.rate_review_rounded,
                            color: Colors.blue[700],
                          )),
                          count: 2),
                    ),
                    Expanded(
                      child: StatusCard(
                          cardText: "Achievements",
                          cardColor: (Colors.orange[200])!,
                          cardIcon: (Icon(
                            Icons.star_rate_rounded,
                            color: (Colors.orange[700]),
                          )),
                          count: 2),
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
