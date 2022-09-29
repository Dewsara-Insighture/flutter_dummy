import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const LoginBackground(
              textTop: "Hello World", textBottom: "this is great"),
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
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const ImageIcon(
                AssetImage("asset/icons/linkedin.png"),
              ),
              label: const Text('Login With LinkedIn'),
            ),
          ),
        ],
      ),
    );
  }
}
