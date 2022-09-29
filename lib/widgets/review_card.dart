import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AspectRatio(
      aspectRatio: 25 / 9,
      child: Card(
        margin: EdgeInsets.only(bottom: 20),
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "It's been a pleasure working with a member like you. You are talented and quick learner asdasdasdasdas",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Henry Parker",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
