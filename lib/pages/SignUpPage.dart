import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/AccountPage.dart';
import 'package:organize_isler/reusable_widgets/reusable_widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

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
                          top: 195 * fem, //sol alt mor
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
                          top: 15 * fem,   //sarılar ortak
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
                          left: 268 * fem,
                          top: -8 * fem,
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
                          top: 200 * fem,
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
                  reusableTextField("Kullanıcı Adı", Icons.person_outline, false,
                      _userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("E - Mail", Icons.mail_outline_rounded, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Parola", Icons.lock_outlined, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child:
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                            password: _passwordTextController.text)
                            .then((value) {
                              print("Created New Account");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AccountPage()));
                        }).onError((error, stackTrace){
                          print("Error ${error.toString()}");
                        });
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
    )
    );
  }
}
