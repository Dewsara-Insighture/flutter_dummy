import 'package:flutter/material.dart';

class LoginBackground extends StatefulWidget {
  final String textTop;

  final String textBottom;

  const LoginBackground({
    super.key,
    required this.textTop,
    required this.textBottom,
  });

  @override
  State<LoginBackground> createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
        height: (screenHeight / 4) * 3,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF14213d),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Welcome to',
              style: TextStyle(color: Colors.white70, fontSize: 25),
            ),
            Text(
              'We Value You',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Image(
                image: AssetImage("asset/images/review2.png"),
              ),
            ),
            Text(
              'Value your Employees has \n never been Easier',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firstCurveStart = Offset(size.width / 5, size.height);
    var firstCurveEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(firstCurveStart.dx, firstCurveStart.dy,
        firstCurveEnd.dx, firstCurveEnd.dy);

    var secondCurveStart =
        Offset(size.width - (size.width / 3.24), size.height - 90);
    var secondCurveEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondCurveStart.dx, secondCurveStart.dy,
        secondCurveEnd.dx, secondCurveEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
