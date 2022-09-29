import 'package:flutter/material.dart';

import '../quote.dart';

// import 'package:flutter_application_1/widgets/ninja_home.dart';

//Importing the model calsses.

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function() delete;
  final Map stdMap = {'name': 'kamal'};

  QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => delete(), icon: const Icon(Icons.cancel)),
              ],
            ),
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                quote.author,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
