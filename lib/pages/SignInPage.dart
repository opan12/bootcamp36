import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 414;
    double fem = screenWidth / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.54,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -70 * fem,
                          top: 195 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 230.9 * fem,
                              height: 250.19 * fem,
                              child: Image.asset(
                                'assets/page-1/images/vector-cwW.png',
                                width: 230.9 * fem,
                                height: 250.19 * fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -55.2869 * fem,
                          top: 10.9729614258 * fem,
                          child: Container(
                            width: 567.42 * fem,
                            height: 425.69 * fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                    0 * fem,
                                    0 * fem,
                                    0 * fem,
                                    30 * fem,
                                  ),
                                  width: 214.31 * fem,
                                  height: 161.56 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-rXn.png',
                                    width: 214.31 * fem,
                                    height: 161.56 * fem,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                    320.71 * fem,
                                    0 * fem,
                                    0 * fem,
                                    0 * fem,
                                  ),
                                  width: 232.71 * fem,
                                  height: 232.66 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-tUL.png',
                                    width: 242.71 * fem,
                                    height: 232.66 * fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20 * fem,
                          top: 55 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 55 * fem,
                              height: 55 * fem,
                              child: Image.asset(
                                'assets/page-1/images/group-6802.png',
                                width: 55 * fem,
                                height: 55 * fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 260 * fem,
                          top: -25 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 180 * fem,
                              height: 200 * fem,
                              child: Image.asset(
                                'assets/page-1/images/vector.png',
                                width: 195 * fem,
                                height: 205 * fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 27.5 * fem,
                          top: 196 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 351 * fem,
                              height: 62 * fem,
                              child: Text(
                                'Hesabını Oluştur!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Source Sans 3',
                                  fontSize: 36 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.1625 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      20 * fem,
                      0 * fem,
                      20 * fem,
                      0 * fem,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Metin alanına tıklandığında yapılacak işlemler
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              27 * fem,
                              27 * fem,
                              27 * fem,
                              10 * fem,
                            ),
                            width: 374 * fem,
                            height: 63 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f3f7),
                              borderRadius: BorderRadius.circular(15 * fem),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Kullanıcı Adı',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      20 * fem,
                      15 * fem,
                      20 * fem,
                      9 * fem,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Metin alanına tıklandığında yapılacak işlemler
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              27 * fem,
                              27 * fem,
                              27 * fem,
                              10 * fem,
                            ),
                            width: 374 * fem,
                            height: 63 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f3f7),
                              borderRadius: BorderRadius.circular(15 * fem),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'E-Mail',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      20 * fem,
                      6 * fem,
                      20 * fem,
                      9 * fem,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Metin alanına tıklandığında yapılacak işlemler
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              27 * fem,
                              27 * fem,
                              27 * fem,
                              10 * fem,
                            ),
                            width: 374 * fem,
                            height: 63 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f3f7),
                              borderRadius: BorderRadius.circular(15 * fem),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Parola',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child:
                    GestureDetector(
                      onTap: () {
                        // Butona tıklandığında yapılacak işlemler
                        print("Butona Basıldı");
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          0 * fem,
                          10 * fem,
                          0 * fem,
                          0 * fem,
                        ),
                        width: 356 * fem,
                        height: 63 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff8e97fd),
                          borderRadius: BorderRadius.circular(38 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Hadi Başlayalım',
                            style: TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.0809999875 * ffem / fem,
                              letterSpacing: 0.7 * fem,
                              color: Color(0xfff6f1fb),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}