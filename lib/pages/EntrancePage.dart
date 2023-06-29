import 'package:flutter/material.dart';
import 'package:organize_isler/pages/LoginPage.dart';

import 'SignUpPage.dart';

class EntrancePage extends StatelessWidget {
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
            child: Stack(children: [
              Positioned(
                child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/entrance/deneme.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                )
                ),
                Positioned(
                  top: 25,
                    child: Container(
                child: Column(children: [
                const Align(
                alignment: Alignment.topLeft,
                child: Text(
                "Merhaba \nHoş Geldiniz!",
                style: TextStyle(
                fontFamily: 'Source Sans 3',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
                ),
                ),
                ]),
                )
                ),
              Positioned(
                  child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.only(top: 150.0, right: 15),
                  child: const Text(
                    "En özel anlarını daha da unutulmaz \nkılmak için buradasınız.",
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
              Positioned(
                top: 649,
                  left: 50,
                  child: Align(
    alignment: Alignment.bottomCenter,
    child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Butona tıklanıyor
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 92.0,
            ),
            primary: Color(0xFF8E97FD),
          ),
          child: const Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      signUpOption(context),
      ]
    )
              ))
            ])));
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("ZATEN BİR HESABIN VAR MI?",
          style: TextStyle(color: Colors.grey)),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: const Text(
          " Giriş Yap",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
