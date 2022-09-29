import 'package:flutter/material.dart';

class NinjaHome extends StatefulWidget {
  const NinjaHome({super.key});

  @override
  State<NinjaHome> createState() => _NinjaHomeState();
}

class _NinjaHomeState extends State<NinjaHome> {
  int ratingVal = 0;

  void getData() async {
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return 'Shang Chi';
    });

    print('${username}');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 27, 27),
      appBar: AppBar(
        title: const Text('Ninja App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("asset/images/ninja2.jpg"),
                radius: 40,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.grey[400], fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Shang Chi',
                style: TextStyle(color: Colors.amber[600], fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Skill Rating',
              style: TextStyle(color: Colors.grey[400], fontSize: 15),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber[600],
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    '$ratingVal',
                    style: TextStyle(color: Colors.amber[600], fontSize: 30),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Clan Name',
              style: TextStyle(color: Colors.grey[400], fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Cobra',
                style: TextStyle(color: Colors.amber[600], fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rating');
              },
              child: const Text('Go to Rating'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => {ratingVal += 2});
        },
        backgroundColor: Colors.grey[700],
        child: const Icon(Icons.add_reaction_outlined),
      ),
    );
  }
}
