import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Auth0 auth0;

  @override
  void initState() {
    // auth0 = Auth0("wvu-dev.au.auth0.com", "COaGVMvNEx17hmd2Fi6Ies0cHvqYoOg1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProfile userDet =
        Provider.of<UserProvider>(context, listen: false).usrPrf;

    print("User:- ${userDet.profileUrl}");
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
            Text(
              "${userDet.name}",
              style: const TextStyle(
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
              text: "${userDet.profileUrl}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Phone'),
            Text(
              '${userDet.phoneNumber}',
              style: const TextStyle(
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
                  onPressed: () async {
                    await auth0.webAuthentication(scheme: 'https').logout();
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
