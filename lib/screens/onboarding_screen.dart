import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  List<dynamic> onboard = [
    {
      "title": "Track Your work and get the result",
      "image": "asset/images/trackWork.png",
      "desc": "Remember to keep track of your professional accomplishments.",
    },
    {
      "title": "Stay organized with team",
      "image": "asset/images/teamImage.png",
      "desc":
          "But understanding the contributions our colleagues make to our teams and companies.",
    },
    {
      "title": "Get Notified",
      "image": "asset/images/getNotified.png",
      "desc":
          "Take control of notifications, collaborate live or on your own time.",
    }
  ];

  int _onboardCount = 0;

  List colors = [
    [const Color(0xff0052D4), const Color(0xff9CECFB)],
    [const Color(0xff3f2b96), const Color(0xffa8c0ff)],
    [const Color(0xff007991), const Color(0xff78ffd6)],
  ];

  AnimatedContainer _bottomDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color:
            _onboardCount == index ? const Color(0xFF000000) : Colors.black45,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _onboardCount == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryDat = MediaQuery.of(context);
    var sWidth = mediaQueryDat.size.width;
    var sHeight = mediaQueryDat.size.height;
    var bWidth = sWidth / 100;
    var bHeigt = sHeight / 100;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors[_onboardCount],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) => setState(
                  () {
                    _onboardCount = value;
                  },
                ),
                itemCount: onboard.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Image.asset(
                            onboard[i]['image'],
                            height: bHeigt * 35,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            onboard[i]["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              fontSize: (sWidth <= 550) ? 30 : 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboard.length,
                      (index) => _bottomDots(index: index),
                    ),
                  ),
                  _onboardCount + 1 == onboard.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (sWidth <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: sWidth * 0.2, vertical: 25),
                              textStyle: TextStyle(
                                  fontSize: (sWidth <= 550) ? 13 : 17),
                            ),
                            child: const Text('START'),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (sWidth <= 550) ? 13 : 17,
                                  ),
                                ),
                                child: const Text(
                                  "SKIP",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (sWidth <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 25),
                                  textStyle: TextStyle(
                                      fontSize: (sWidth <= 550) ? 13 : 17),
                                ),
                                child: const Text('NEXT'),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
