// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login_background.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Auth0 auth0;
  Credentials? _credentials;

  @override
  void initState() {
    auth0 = Auth0(
        "https://wvu-dev.au.auth0.com", "COaGVMvNEx17hmd2Fi6Ies0cHvqYoOg1");
    super.initState();
  }

  Future Userlogin() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // conveyancer.insighture@gmail.com
        //conveyancer123@
        children: [
          const LoginBackground(),
          const SizedBox(height: 60),
          SizedBox(
            width: 300.0,
            height: 50,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: const BorderSide(color: Color(0xFF0077B6), width: 3),
              ),
              label: const Text(
                'Login With LinkedIn',
              ),
              onPressed: () async {
                // final isLoggedIn =
                //     await auth0.credentialsManager.hasValidCredentials();
                // if (isLoggedIn) {
                //   final credentials =
                //       await auth0.credentialsManager.credentials();
                //   Provider.of<UserProvider>(context, listen: false)
                //       .saveUserDetails(credentials.user);
                //   Navigator.pushNamed(context, '/onboarding');
                // } else {
                //   final crendentials =
                //       await auth0.webAuthentication(scheme: 'https').login();

                //   Provider.of<UserProvider>(context, listen: false)
                //       .saveUserDetails(crendentials.user);
                //   Navigator.pushNamed(context, '/onboarding');
                // }

                final crendentials =
                    await auth0.webAuthentication(scheme: 'https').login();

                // Provider.of<UserProvider>(context, listen: false)
                //     .saveUserDetails(crendentials.user);
                // Navigator.pushNamed(context, '/onboarding');
              },
              icon: const ImageIcon(
                AssetImage("asset/icons/linkedin.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
