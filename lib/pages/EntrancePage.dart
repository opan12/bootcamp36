
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class EntrancePage extends StatefulWidget {
  @override
  _EntrancePageState createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: double.infinity,
      child: Container(
        // signupandsigninVZE (1:52)
        padding: EdgeInsets.fromLTRB(0 * fem, 4 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // autogroupo6bnfEk (2MeMkJaZquQ9q6jvpCo6bn)
              margin: EdgeInsets.fromLTRB(
                  0 * fem, 0 * fem, 59.5 * fem, 12 * fem),
              width: 346 * fem,
              height: 131 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // merhabaZqv (1:107)
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 346 * fem,
                        height: 76 * fem,
                        child: Text(
                          'Merhaba,  ',
                          style: SafeGoogleFont(
                            'Source Sans 3',
                            fontSize: 65 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1625 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // hogeldinizU5i (1:108)
                    left: 2 * fem,
                    top: 72 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 319 * fem,
                        height: 59 * fem,
                        child: Text(
                          'hoş geldiniz!',
                          style: SafeGoogleFont(
                            'Source Sans 3',
                            fontSize: 50 * ffem,
                            fontWeight: FontWeight.w400,
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
              // autogroup9nzqYLU (2MeMv3oL3bP2FQLbps9nzQ)
              width: 875.22 * fem,
              height: 574 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // vectorrc4 (1:53)
                    left: 0 * fem,
                    top: 22 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 429.72 * fem,
                        height: 520.96 * fem,
                        child: Image.asset(
                          'assets/page-1/images/vector-zBW.png',
                          width: 429.72 * fem,
                          height: 520.96 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle210vrp (1:54)
                    left: 19.5 * fem,
                    top: 428 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 374 * fem,
                        height: 63 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15 * fem),
                            color: Color(0xfff2f2f7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle211ovc (1:55)
                    left: 19.5 * fem,
                    top: 511 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 374 * fem,
                        height: 63 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15 * fem),
                            color: Color(0xfff2f2f7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group6802tBN (1:61)
                    left: 0 * fem,
                    top: 74 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 332 * fem,
                        height: 357 * fem,
                        child: Image.asset(
                          'assets/page-1/images/group-6802.png',
                          width: 332 * fem,
                          height: 357 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // parolabba (1:105)
                    left: 39.5 * fem,
                    top: 536 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 54 * fem,
                        height: 18 * fem,
                        child: Text(
                          'Parola',
                          style: SafeGoogleFont(
                            'Source Sans 3',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.0809999704 * ffem / fem,
                            letterSpacing: 0.8 * fem,
                            color: Color(0xffa1a4b2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // epostasZ6 (1:106)
                    left: 39.5 * fem,
                    top: 452 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 65 * fem,
                        height: 18 * fem,
                        child: Text(
                          'E-Posta',
                          style: SafeGoogleFont(
                            'Source Sans 3',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.0809999704 * ffem / fem,
                            letterSpacing: 0.8 * fem,
                            color: Color(0xffa1a4b2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // enzelanlarndahadaunutulmazklma (1:109)
                    left: 102.5 * fem,
                    top: 44 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 291 * fem,
                        height: 72 * fem,
                        child: Text(
                          '“En özel anlarınızı daha da unutulmaz\n kılmak için buradasınız.”',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Source Sans 3',
                            fontSize: 20.5 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.1625 * ffem / fem,
                            fontStyle: FontStyle.italic,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse52Czg (1:110)
                    left: 74.5 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 350 * fem,
                        height: 186 * fem,
                        child: Image.asset(
                          'assets/page-1/images/ellipse-52.png',
                          width: 350 * fem,
                          height: 186 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupyfd66qA (2MeN9HvGAZCZb3dycNyFd6)
              padding: EdgeInsets.fromLTRB(
                  23.5 * fem, 13 * fem, 16.5 * fem, 9 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group6778nxt (1:56)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 50 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupoa9aHue (2MeNGsXxzKBgacfActoa9a)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 19 * fem),
                          width: double.infinity,
                          height: 63 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff8e97fd),
                            borderRadius: BorderRadius.circular(38 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Üye ol',
                              style: SafeGoogleFont(
                                'Source Sans 3',
                                fontSize: 21 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.0810000102 * ffem / fem,
                                letterSpacing: 1.05 * fem,
                                color: Color(0xfff6f1fa),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          // zatenbirhesabinvarmigiriyapJCU (1:59)
                          margin: EdgeInsets.fromLTRB(
                              16 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: RichText(
                            text: TextSpan(
                              style: SafeGoogleFont(
                                'HelveticaNeue',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.0809999875 * ffem / fem,
                                letterSpacing: 0.7 * fem,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'ZATEN BİR HESABIN VAR MI?',
                                  style: SafeGoogleFont(
                                    'Source Sans 3',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0809999875 * ffem / fem,
                                    letterSpacing: 0.7 * fem,
                                    color: Color(0xffa1a4b2),
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: SafeGoogleFont(
                                    'Source Sans 3',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0809999875 * ffem / fem,
                                    letterSpacing: 0.7 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: 'GİRİŞ YAP',
                                  style: SafeGoogleFont(
                                    'Source Sans 3',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.0809999875 * ffem / fem,
                                    letterSpacing: 0.7 * fem,
                                    color: Color(0xff8e97fd),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // line2YY4 (1:60)
                    margin: EdgeInsets.fromLTRB(
                        112.5 * fem, 0 * fem, 118.5 * fem, 0 * fem),
                    width: double.infinity,
                    height: 5 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffe6e6e6),
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