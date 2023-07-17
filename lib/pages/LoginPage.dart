import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/AccountPage.dart';
import 'package:organize_isler/pages/CompanyProfilePage.dart';
import 'package:organize_isler/pages/HomePage.dart';
import 'package:organize_isler/pages/ResetPassword.dart';
import 'package:organize_isler/pages/ServicePage.dart';

import '../reusable_widgets/reusable_widgets.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Future<String?> getUserTypeFromFirestore(String email, String password) async {
    // Implement your logic to fetch the userType from Firestore using the provided email and password
    // You can use the Firebase SDK or Firestore package to query the Firestore database

    // Here's an example using the Firebase SDK to retrieve the userType based on the user's email
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.get('userType');
      } else {
        return null; // User not found or userType not available
      }
    } catch (error) {
      print("Error fetching userType from Firestore: $error");
      return null;
    }
  }

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
                        Positioned( //logo
                          left: 110 * fem,
                          top: 308 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 180 * fem,
                              height: 200 * fem,
                              child: Image.asset(
                                'assets/page-1/images/organizefirmalogo2.png',
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
                                'Tekrar Hoş Geldin!',
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
                  reusableTextField("E - Mail", Icons.mail_outline_rounded, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Parola", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) async {
                        print("Login Account");

                        // Fetch the userType from Firestore
                        String? userType = await getUserTypeFromFirestore(
                            _emailTextController.text, _passwordTextController.text);

                        // Check the user type and navigate accordingly
                        if (userType == "regular") {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ServicePage()),
                          );
                        } else if (userType == "company") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CompanyProfilePage()),
                          );
                        } else {
                          // Handle other user types or display an error message
                        }
                      }).onError((error, stackTrace) {
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
                          'Giriş Yap',
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
                  forgetPassword(context),
                  signUpOption(context),
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

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Hesabın yok mu?",
          style: TextStyle(color: Colors.grey)),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: const Text(
          " Kayıt Ol",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

//Düzenlenicek
Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResetPassword())),
    ),
  );
}

