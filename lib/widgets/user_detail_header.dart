import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class UserDetailHeader extends StatelessWidget {
  final User user;
  const UserDetailHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white.withOpacity(0.6),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(user.avatarImg),
                            radius: 40,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90.0),
                                color: Colors.white.withOpacity(0.8)),
                            child: Row(children: [
                              Icon(
                                Icons.star_rate_rounded,
                                size: 14,
                                color: Colors.amber[900],
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.amber[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      user.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      user.position,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
