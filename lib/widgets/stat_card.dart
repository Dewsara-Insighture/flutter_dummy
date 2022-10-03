import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final Color cardColor;
  final Icon cardIcon;
  final int count;
  final String cardText;
  const StatusCard(
      {super.key,
      required this.cardColor,
      required this.cardIcon,
      required this.count,
      required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            cardIcon,
            Text(
              '$count',
              style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              cardText,
              style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
