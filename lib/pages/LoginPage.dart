import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _passwordError;

  @override
  void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
  }

  void _signIn() {
  if (_formKey.currentState!.validate()) {
  // Perform sign-in logic
  print('Sign In Successful');
  }
  }

    Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      double baseWidth = 414;
      double fem = screenWidth / baseWidth;
      double ffem = fem * 0.97;

      return Scaffold(
        body: Container(
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
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 230.9 * fem,
                                  height: 250.19 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-rXn.png',
                                    width: 230.9 * fem,
                                    height: 250.19 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -55.2869 * fem,
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
                                        'assets/page-1/images/vector.png',
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
                                        'assets/page-1/images/vector-cwW.png',
                                        width: 242.71 * fem,
                                        height: 232.66 * fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              right: 260 * fem,
                              top: -25 * fem,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 180 * fem,
                                  height: 200 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-tUL.png',
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
                                alignment: Alignment.centerLeft,
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
                      SizedBox(height: 40.0),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorText: _passwordError,
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _passwordError = null; // Clear the error message on each change
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8 || value.length > 16) {
                            return 'Password must be 8-16 characters long';
                          }
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return 'Password must contain at least one lowercase letter';
                          }
                          if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Password must contain at least one punctuation mark';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {  },
                        child: Text('Sign In'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
