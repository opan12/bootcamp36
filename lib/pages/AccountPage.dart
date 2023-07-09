import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/CompanyEditPage.dart';
import 'package:organize_isler/pages/CompanyProfilePage.dart';
import 'package:organize_isler/pages/HomePage.dart';
import 'package:organize_isler/pages/SignUpPage.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
              left: -80 * fem,
              bottom: 510 * fem,
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
              left: -45 * fem,
              top: 180 * fem,
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
              left: -50 * fem,
              top: 340 * fem,
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
              left: 3,
              top: 160 * fem,
              child: Align(
                child: SizedBox(
                  width: 395 * fem,
                  height: 206 * fem,
                  child: Text(
                    'Merhaba,\n organizasyonun her adımında yardımcı\n Organize İşler’e Hoşgeldin!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 1.3 * ffem / fem,
                      letterSpacing: 0 * fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 520,
              left: 25,
              child: Container(
              child: GestureDetector(
                onTap: () {
                    print("şirket hesabı seçildi");
                    _onCompanyAccountPressed();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompanyEditPage()),
                    );
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
              top: 590,
              left: 25,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    print("kullanıcı hesabı seçildi");
                    _onUserAccountPressed();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
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
          ],
        ),
      ),
    );
  }
}



void _onUserAccountPressed() async {
    print("KULLANICI HESABI");

    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String userType = 'regular';

      // Firestore kullanıcı kaydını güncelle
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({'userType': userType});

      print("Kullanıcı tipi güncellendi: $userType");
    } else {
      print("Hata: Geçerli kullanıcı bulunamadı.");
    }
  }

  void _onCompanyAccountPressed() async {
    print("ŞİRKET HESABI");

    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String userType = 'company';

      // Firestore kullanıcı kaydını güncelle
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({'userType': userType});

      print("Kullanıcı tipi güncellendi: $userType");
    } else {
      print("Hata: Geçerli kullanıcı bulunamadı.");
    }
  }


