import 'package:flutter/material.dart';
import 'package:myapp/pages/SignUpPage.dart';

import '../utils/utils.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 844 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Container(
          width: 414 * fem,
          height: 896 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -80 * fem,
                bottom: 490 * fem,
                child: Align(
                  child: SizedBox(
                    width: 474 * fem,
                    height: 469 * fem,
                    child: Image.asset(
                      'assets/page-4/adsz-ouu-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 54 * fem,
                    height: 21 * fem,
                    child: Image.asset(
                      'assets/page-4/time-light.png',
                      width: 54 * fem,
                      height: 21 * fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -45 * fem,
                top: 172 * fem,
                child: Align(
                  child: SizedBox(
                    width: 500 * fem,
                    height: 500 * fem,
                    child: Image.asset(
                      'assets/page-4/t4wers-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 525 * fem,
                left: 10 * fem,
                child: Container(
                  child: InkWell(
                    onTap: _onUserAccountPressed,
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
                          'ŞİRKET HESABI',
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
              ),
              Positioned(
                top: 595 * fem,
                left: 10 * fem,
                child: Container(
                  child: InkWell(
                    onTap: _onCompanyAccountPressed,
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
                          'KULLANICI HESABI',
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
              ),
              Positioned(
                left: -60 * fem,
                top: 350 * fem,
                child: Align(
                  child: SizedBox(
                    width: 500 * fem,
                    height: 500 * fem,
                    child: Image.asset(
                      'assets/page-4/adsz-tasarm-2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -5 ,
                top: 175 * fem,
                child: Align(
                  child: SizedBox(
                    width: 395 * fem,
                    height: 206 * fem,
                    child: Text(
                      'Merhaba Afsar, organizasyonun her adımında yardımcı\n Organize İşler’e Hoşgeldin!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontSize: 29 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.3 * ffem / fem,
                        letterSpacing: 0 * fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUserAccountPressed() {
    print("KULLANICI HESABI");
    // İşlemleri buraya ekleyebilirsiniz
  }

  void _onCompanyAccountPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }
}

