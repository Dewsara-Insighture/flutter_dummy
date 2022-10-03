import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: LikeButton(
            size: 20,
            likeCount: 665,
          ),
        ),
      ],
    );
  }
}
