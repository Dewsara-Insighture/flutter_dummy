import 'package:flutter/material.dart';

class CompanyBody extends StatelessWidget {
  const CompanyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: isPortrait ? screenHeight : null,
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 140,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned(
                      top: -40,
                      child: Column(children: [
                        Container(
                          height: 100,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                            color: Color(0xffffa62b),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Image(
                            image: AssetImage("asset/images/logo.png"),
                          ),
                        ),
                        const Text(
                          'Insighture',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Vision',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9A99A3)),
                    ),
                  ),
                  Text(
                      'We help technology backed businesses build and scale their services. We apply decades of our industry experience in providing you with the most effective and affordable technology solutions. Our clients are amazed by the improvement in quality and technical expertise we bring to the table besides being cost-effective.'),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Services',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9A99A3)),
                    ),
                  ),
                  Text('\u2022 Software Development'),
                  Text('\u2022 Product Development'),
                  Text('\u2022 Cloud Migrations'),
                  Text('\u2022 Machine Learning and AI'),
                  Text('\u2022 Digital Transformation'),
                  SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
    // return Expanded(
    //   child: Stack(
    //     alignment: AlignmentDirectional.topCenter,
    //     fit: StackFit.loose,
    //     clipBehavior: Clip.none,
    //     children: <Widget>[
    //       Container(
    //         margin: const EdgeInsets.only(top: 20),
    //         decoration: const BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.only(
    //             topRight: Radius.circular(30),
    //             topLeft: Radius.circular(30),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         top: -40,
    //         child: Column(children: [
    //           Container(
    //             height: 100,
    //             width: 100,
    //             padding: EdgeInsets.symmetric(horizontal: 5),
    //             decoration: BoxDecoration(
    //               color: Color(0xffffa62b),
    //               borderRadius: const BorderRadius.all(
    //                 Radius.circular(10),
    //               ),
    //             ),
    //             child: Image(
    //               image: AssetImage("asset/images/logo.png"),
    //             ),
    //           ),
    //           Text(
    //             'Insighture',
    //             style: TextStyle(
    //                 fontSize: 40,
    //                 fontWeight: FontWeight.bold,
    //                 decoration: TextDecoration.underline),
    //           )
    //         ]),
    //       )
    //     ],
    //   ),
    // );
  }
}
