import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Random random = Random();
  int soruIndex = 0;
  int puan = 0;
  TextEditingController cevapController = TextEditingController();

  List<Bilmece> bilmeceListesi = [
    Bilmece(
      soru: 'Birinci ayda sadece 2. ay olan şey nedir?',
      cevap: 'A harfi',
    ),
    Bilmece(
      soru: 'En hızlı sayı nedir?',
      cevap: 'Yüzyirmi',
    ),
    Bilmece(
      soru: 'Kendisiyle birlikte 28 çalan ne değildir?',
      cevap: 'Saat',
    ),
    Bilmece(
      soru: 'En sevilen meyve hangisidir?',
      cevap: 'Muz',
    ),
    Bilmece(
      soru: 'Hangi çay demlenmez?',
      cevap: 'Açık çay',
    ),

    Bilmece(
      soru: 'Hangi yemeği kimse yiyemez?',
      cevap: 'Dökme pilav',
    ),
    Bilmece(
      soru: 'Hangi balık en çok bilgi sahibi olan balıktır?',
      cevap: 'Akıl balığı',
    ),
    Bilmece(
      soru: 'Hangi yemek hem pişer hem soğur?',
      cevap: 'Dondurma',
    ),
    Bilmece(
      soru: 'Hangi yemek asla pişmez?',
      cevap: 'Buzdolması',
    ),
  ];

  @override
  void dispose() {
    cevapController.dispose();
    super.dispose();
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
        child: Stack(children: [
        Positioned(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bilmeceListesi[soruIndex].soru,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: cevapController,
              decoration: InputDecoration(
                hintText: 'Cevabınızı yazın',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff8e97fd),
              ),
              child: Text(
                'Cevabı Kontrol Et',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                cevapKontrolEt();
              },
            ),
            SizedBox(height: 20),
            Text(
              'Puan: $puan',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
          Positioned(
            left: 23 * fem,
            top: 10 * fem,
            child: Align(
              child: SizedBox(
                width: 360 * fem,
                height: 400 * fem,
                child: Image.asset(
                  'assets/page-1/images/organizefirmalogo2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
    ]

    )));



  }

  void cevapKontrolEt() {
    String dogruCevap = bilmeceListesi[soruIndex].cevap;
    String verilenCevap = cevapController.text;

    if (dogruCevap.toLowerCase() == verilenCevap.toLowerCase()) {
      puan++;
    } else {
      puan--;
    }

    cevapController.clear();

    setState(() {
      soruIndex = random.nextInt(bilmeceListesi.length);
    });
  }
}

class Bilmece {
  String soru;
  String cevap;

  Bilmece({required this.soru, required this.cevap});
}
