import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/widgets/user_detail_background.dart';
import 'package:flutter_application_1/widgets/user_detail_body.dart';
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
        body: Column(
          children: [
            UserDetailBackground(user: userDet),
            UserDetailBody(user: userDet),
          ],
        ),
      ),
    );
  }
}
