import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 414;
    double fem = screenWidth / baseWidth;
    double ffem = fem * 0.97;

    return Material(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              left: 0 * fem,
              top: 10 * fem,
              child: Align(
                child: SizedBox(
                  width: 297 * fem,
                  height: 108 * fem,
                  child: Text(
                    'Organize etmeye\nhazır mısın?',
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 40 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.35 * ffem / fem,
                      color: Color(0xff3f414e),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0 * fem,
              top: 115 * fem,
              child: Align(
                child: SizedBox(
                  width: 500 * fem,
                  height: 26 * fem,
                  child: Text(
                    'Organize etmek istediğin etkinliği seç!',
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2575 * ffem / fem,
                      color: Color(0xffa1a4b2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle container 1 click
                    },
                    child: Container(
                      width: 176 * fem,
                      height: 200 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: const Color(0xff8e97fd),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/home/img.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Boşluk eklemek için SizedBox kullandık
                  GestureDetector(
                    onTap: () {
                      // Handle container 2 click
                    },
                    child: Container(
                      width: 176.43 * fem,
                      height: 170 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: const Color(0xfffa6e5a),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/home/img_3.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 340,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle container 3 click
                    },
                    child: Container(
                      width: 176.43 * fem,
                      height: 167 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0xfffeb18f),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 217.57 * fem,
                              height: 218 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  color: Color(0xfffeb18f),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/home/img_1.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle container 4 click
                    },
                    child: Container(
                      width: 176.43 * fem,
                      height: 210 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Color(0xffffcf86),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/home/img_4.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 540,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle container 5 click
                    },
                    child: Container(
                      width: 176.43 * fem,
                      height: 210 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Color(0xff6cb28e),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/home/img_2.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle container 6 click
                    },
                    child: Container(
                      width: 176.43 * fem,
                      height: 185 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Color(0xff3f414e),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/home/img_5.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
