import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.grey[400]?.withOpacity(0.5),
                child: CircleAvatar(
                  radius: 62.5,
                  backgroundColor: Colors.grey[400]?.withOpacity(0.6),
                  child: const CircleAvatar(
                    backgroundImage:
                        AssetImage("asset/images/female_user_1.jpg"),
                    radius: 60,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Username'),
            const Text(
              'Hannah Elanie',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Linkedin'),
            Linkify(
              onOpen: (link) {
                print("Linkify link = ${link.url}");
              },
              text: "https://www.linkedin.com/in/conve-halo-8a8b33251/",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Phone'),
            const Text(
              '+94716548236',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Designation'),
            const Text(
              'Senior Software Engineer',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 200.0,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 216, 47, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Logout'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
