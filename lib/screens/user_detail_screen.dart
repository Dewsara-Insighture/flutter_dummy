import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/landscape/user_detail_body_lm.dart';
import '../widgets/landscape/user_detail_header_lm.dart';
import '../widgets/user_detail_header.dart';
import '../widgets/user_detail_body.dart';
import 'dart:math';

class UserDetailScreen extends StatelessWidget {
  final User userDet;
  const UserDetailScreen({super.key, required this.userDet});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Column(
                children: [
                  UserDetailHeader(user: userDet),
                  UserDetailBody(user: userDet),
                ],
              );
            } else {
              return Column(
                children: [
                  UserDetailHeaderLandscape(user: userDet),
                  UserDetailBodyLandscape(user: userDet),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
