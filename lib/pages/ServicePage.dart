import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>{
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone141dNo (11:51)
        width: double.infinity,
        height: 844*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // merhabaRhy (11:52)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                width: 414*fem,
                height: 896*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // adszouu1hQb (11:53)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 474*fem,
                          height: 469*fem,
                          child: Image.asset(
                            'assets/servicepage/images/adsz-ouu-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // timelightNFq (11:76)
                      left: 2*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 54*fem,
                          height: 21*fem,
                          child: Image.asset(
                            'assets/servicepage/images/time-light-wNo.png',
                            width: 54*fem,
                            height: 21*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // group6777g1d (11:82)
                      left: 0*fem,
                      top: 606*fem,
                      child: Container(
                        width: 374*fem,
                        height: 63*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(38*fem),
                        ),
                        child: Center(
                          // rectangle210beP (11:83)
                          child: SizedBox(
                            width: double.infinity,
                            height: 63*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(38*fem),
                                color: Color(0xffebeaec),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // t4wers15E7 (11:90)
                      left: 0*fem,
                      top: 172*fem,
                      child: Align(
                        child: SizedBox(
                          width: 500*fem,
                          height: 500*fem,
                          child: Image.asset(
                            'assets/servicepage/images/t4wers-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // adsztasarm2Pkb (11:91)
                      left: 0*fem,
                      top: 370*fem,
                      child: Align(
                        child: SizedBox(
                          width: 500*fem,
                          height: 500*fem,
                          child: Image.asset(
                            'assets/servicepage/images/adsz-tasarm-2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // anasayfavtw (14:2)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(2.5*fem, 13*fem, 0*fem, 0*fem),
                width: 414*fem,
                height: 896*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupaxptw3M (F7y6qfhEDF2e5zEZuhaXpT)
                      margin: EdgeInsets.fromLTRB(11*fem, 0*fem, 34.5*fem, 7*fem),
                      width: double.infinity,
                      height: 21*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // timelightpsq (14:656)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 243*fem, 0*fem),
                            padding: EdgeInsets.fromLTRB(11*fem, 3*fem, 10*fem, 3*fem),
                            height: double.infinity,
                            decoration: BoxDecoration (
                              image: DecorationImage (
                                fit: BoxFit.cover,
                                image: AssetImage (
                                  'assets/servicepage/images/time-light-background-mask.png',
                                ),
                              ),
                            ),
                            child: Center(
                              // timelightKJo (14:658)
                              child: SizedBox(
                                width: 33*fem,
                                height: 15*fem,
                                child: Image.asset(
                                  'assets/servicepage/images/time-light.png',
                                  width: 33*fem,
                                  height: 15*fem,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // statusiconsEgf (14:662)
                            margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 2*fem),
                            height: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // networksignallightmAo (14:663)
                                  width: 20*fem,
                                  height: 14*fem,
                                  child: Image.asset(
                                    'assets/servicepage/images/network-signal-light.png',
                                    width: 20*fem,
                                    height: 14*fem,
                                  ),
                                ),
                                SizedBox(
                                  width: 4*fem,
                                ),
                                Container(
                                  // wifisignallightdyh (14:672)
                                  width: 16*fem,
                                  height: 14*fem,
                                  child: Image.asset(
                                    'assets/servicepage/images/wifi-signal-light.png',
                                    width: 16*fem,
                                    height: 14*fem,
                                  ),
                                ),
                                SizedBox(
                                  width: 4*fem,
                                ),
                                Container(
                                  // batterylightXZH (14:677)
                                  width: 25*fem,
                                  height: 14*fem,
                                  child: Image.asset(
                                    'assets/servicepage/images/battery-light.png',
                                    width: 25*fem,
                                    height: 14*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupqitwTC3 (F7y7BKo9BYDk7RKZn7Qitw)
                      margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 18*fem),
                      width: 472*fem,
                      height: 150*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // seniniinburadayzB83 (14:646)
                            left: 1*fem,
                            top: 51*fem,
                            child: Align(
                              child: SizedBox(
                                width: 471*fem,
                                height: 54*fem,
                                child: Text(
                                  'Senin için buradayız,',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 40*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35*ffem/fem,
                                    color: Color(0xff3f414e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // organizasyonfirmalarnseniniinl (14:650)
                            left: 8*fem,
                            top: 103*fem,
                            child: Align(
                              child: SizedBox(
                                width: 347*fem,
                                height: 47*fem,
                                child: Text(
                                  'Organizasyon firmalarını senin için listeledim, işte tam burada!',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 20*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1625*ffem/fem,
                                    color: Color(0xffa1a4b2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // group6802hkb (14:651)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 55*fem,
                                height: 55*fem,
                                child: Image.asset(
                                  'assets/servicepage/images/group-6802.png',
                                  width: 55*fem,
                                  height: 55*fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroup1kkqb5H (F7y7TpKfNQ2ubAVAZr1kKq)
                      margin: EdgeInsets.fromLTRB(17.5*fem, 0*fem, 0*fem, 7*fem),
                      width: 415.5*fem,
                      height: 213*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // group7JVV (14:3)
                            left: 0*fem,
                            top: 3*fem,
                            child: Align(
                              child: SizedBox(
                                width: 178.5*fem,
                                height: 210*fem,
                                child: Image.asset(
                                  'assets/servicepage/images/group-7.png',
                                  width: 178.5*fem,
                                  height: 210*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // group20nfZ (14:148)
                            left: 53.5*fem,
                            top: 152*fem,
                            child: Container(
                              width: 70*fem,
                              height: 35*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(25*fem),
                              ),
                              child: Center(
                                // rectangle14hnX (14:149)
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 35*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(25*fem),
                                      color: Color(0xffebeaec),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // group8RiX (14:160)
                            left: 197.5*fem,
                            top: 0*fem,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(54*fem, 152*fem, 53*fem, 23*fem),
                              width: 177*fem,
                              height: 210*fem,
                              decoration: BoxDecoration (
                                color: Color(0xffffc97e),
                                borderRadius: BorderRadius.circular(10*fem),
                                image: DecorationImage (
                                  fit: BoxFit.cover,
                                  image: AssetImage (
                                    'assets/servicepage/images/mask-group.png',
                                  ),
                                ),
                              ),
                              child: Align(
                                // group21guM (14:305)
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 70*fem,
                                  height: 35*fem,
                                  child: Image.asset(
                                    'assets/servicepage/images/group-21.png',
                                    width: 70*fem,
                                    height: 35*fem,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // firmabPom (14:648)
                            left: 204.5*fem,
                            top: 93*fem,
                            child: Align(
                              child: SizedBox(
                                width: 211*fem,
                                height: 54*fem,
                                child: Text(
                                  'Firma (B)',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 40*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35*ffem/fem,
                                    color: Color(0xff3f414e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // firmaaHPM (14:649)
                            left: 7.5*fem,
                            top: 93*fem,
                            child: Align(
                              child: SizedBox(
                                width: 211*fem,
                                height: 54*fem,
                                child: Text(
                                  'Firma (A)',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 40*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35*ffem/fem,
                                    color: Color(0xff3f414e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // balazHm (14:683)
                            left: 64.5*fem,
                            top: 160*fem,
                            child: Align(
                              child: SizedBox(
                                width: 62*fem,
                                height: 21*fem,
                                child: Text(
                                  'BAŞLA!',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35*ffem/fem,
                                    color: Color(0xff3f414e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // tahminisre1gnggP (14:684)
                            left: 30.5*fem,
                            top: 192*fem,
                            child: Align(
                              child: SizedBox(
                                width: 150*fem,
                                height: 18*fem,
                                child: Text(
                                  'Tahmini süre, 1 gün.',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 13*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.350000088*ffem/fem,
                                    color: Color(0xff3f414e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // tahminisre1s30dkmSw (14:685)
                            left: 222.5*fem,
                            top: 192*fem,
                            child: Align(
                              child: SizedBox(
                                width: 166*fem,
                                height: 18*fem,
                                child: Text(
                                  'Tahmini süre, 1s 30dk.',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 13*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.350000088*ffem/fem,
                                    color: Color(0xff3f414e),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // bala3vF (14:686)
                            left: 262.5*fem,
                            top: 160*fem,
                            child: Align(
                              child: SizedBox(
                                width: 62*fem,
                                height: 21*fem,
                                child: Text(
                                  'BAŞLA!',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.35*ffem/fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogrouppuc3LeT (F7y7rPWPGkkuP3f5kJPuc3)
                      margin: EdgeInsets.fromLTRB(165*fem, 0*fem, 184.5*fem, 10*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse483Hy (14:640)
                            width: 12*fem,
                            height: 13*fem,
                            child: Image.asset(
                              'assets/servicepage/images/ellipse-48.png',
                              width: 12*fem,
                              height: 13*fem,
                            ),
                          ),
                          SizedBox(
                            width: 13*fem,
                          ),
                          Container(
                            // ellipse499ro (14:642)
                            width: 12*fem,
                            height: 13*fem,
                            child: Image.asset(
                              'assets/servicepage/images/ellipse-49.png',
                              width: 12*fem,
                              height: 13*fem,
                            ),
                          ),
                          SizedBox(
                            width: 13*fem,
                          ),
                          Container(
                            // ellipse50GRd (14:641)
                            width: 12*fem,
                            height: 13*fem,
                            child: Image.asset(
                              'assets/servicepage/images/ellipse-50.png',
                              width: 12*fem,
                              height: 13*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupbmu9Cq5 (F7y84t9Zqb3JNyT2DvBmu9)
                      margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 19.5*fem, 20*fem),
                      width: double.infinity,
                      height: 95*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // group19wGs (14:150)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 378*fem,
                                height: 95*fem,
                                child: Image.asset(
                                  'assets/servicepage/images/group-19.png',
                                  width: 378*fem,
                                  height: 95*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // enbeenilenlerdQb (14:647)
                            left: 11*fem,
                            top: 26*fem,
                            child: Align(
                              child: SizedBox(
                                width: 301*fem,
                                height: 46*fem,
                                child: Text(
                                  'En beğenilenler',
                                  style: SafeGoogleFont (
                                    'Source Sans 3',
                                    fontSize: 34*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3500000449*ffem/fem,
                                    color: Color(0xffff7e9d),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // ekhizmetler7af (14:645)
                      margin: EdgeInsets.fromLTRB(54.5*fem, 0*fem, 0*fem, 17*fem),
                      child: Text(
                        'Ek hizmetler',
                        style: SafeGoogleFont (
                          'Source Sans 3',
                          fontSize: 36*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.0810000102*ffem/fem,
                          color: Color(0xff3f414e),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupkuyfRrF (F7y8EDDMcywkqDKZcrkUYf)
                      margin: EdgeInsets.fromLTRB(17.5*fem, 0*fem, 0*fem, 14*fem),
                      width: double.infinity,
                      height: 157*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupx6tzwpb (F7y8r2X1eJVHxjnrapx6TZ)
                            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                            height: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupywkf5R1 (F7y8VTGxYxXgQmJmZRyWkF)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17.5*fem, 0*fem),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        // group23oro (14:307)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.5*fem, 11.5*fem),
                                        padding: EdgeInsets.fromLTRB(20.5*fem, 2*fem, 14.5*fem, 2.5*fem),
                                        decoration: BoxDecoration (
                                          color: Color(0xffafdbc5),
                                          borderRadius: BorderRadius.circular(10*fem),
                                        ),
                                        child: Center(
                                          // frame6791TRZ (14:687)
                                          child: SizedBox(
                                            width: 127*fem,
                                            height: 109*fem,
                                            child: Image.asset(
                                              'assets/servicepage/images/frame-6791.png',
                                              width: 127*fem,
                                              height: 109*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // kameraman93V (14:643)
                                        'Kameraman',
                                        style: SafeGoogleFont (
                                          'Source Sans 3',
                                          fontSize: 20*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.0809999466*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogroupbpw3ryV (F7y8eHMadbk3JXWMR7BpW3)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0.5*fem, 0*fem, 0*fem),
                                  width: 162*fem,
                                  height: 155*fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // group25yYK (14:628)
                                        left: 0*fem,
                                        top: 0*fem,
                                        child: Container(
                                          width: 162*fem,
                                          height: 155*fem,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // group244Js (14:630)
                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 39*fem),
                                                width: 162*fem,
                                                height: 113*fem,
                                                child: Image.asset(
                                                  'assets/servicepage/images/group-24.png',
                                                  width: 162*fem,
                                                  height: 113*fem,
                                                ),
                                              ),
                                              Container(
                                                // ellipse1xf9 (14:629)
                                                margin: EdgeInsets.fromLTRB(78*fem, 0*fem, 81*fem, 0*fem),
                                                width: double.infinity,
                                                height: 3*fem,
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(1.5*fem),
                                                  color: Color(0xffa1a4b2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // garson5Dy (14:644)
                                        left: 51.5*fem,
                                        top: 124.5029296875*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 80*fem,
                                            height: 22*fem,
                                            child: Text(
                                              'Garson',
                                              style: SafeGoogleFont (
                                                'Source Sans 3',
                                                fontSize: 20*ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.0809999466*ffem/fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // undrawlogodesignregfu61mMh (14:705)
                                        left: 62.3825836182*fem,
                                        top: 0.8648071289*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 39.12*fem,
                                            height: 111.64*fem,
                                            child: Image.asset(
                                              'assets/servicepage/images/undrawlogodesignregfu6-1.png',
                                              width: 39.12*fem,
                                              height: 111.64*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // group26qcT (14:309)
                            width: 162*fem,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupedm1a4F (F7y9HBTmLtHT9RGPP9edM1)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10.5*fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration (
                                    color: Color(0xffafdbc5),
                                    borderRadius: BorderRadius.circular(10*fem),
                                  ),
                                  child: Center(
                                    // maskgroupWCo (14:314)
                                    child: SizedBox(
                                      width: 162*fem,
                                      height: 113.5*fem,
                                      child: Image.asset(
                                        'assets/servicepage/images/mask-group-BGT.png',
                                        width: 162*fem,
                                        height: 113.5*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // temizlikdHR (14:312)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 65*fem, 8*fem),
                                  child: Text(
                                    'Temizlik',
                                    style: SafeGoogleFont (
                                      'Source Sans 3',
                                      fontSize: 20*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0809999466*ffem/fem,
                                      color: Color(0xff3f414e),
                                    ),
                                  ),
                                ),
                                Container(
                                  // group19Wf (14:310)
                                  margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                                  width: 3*fem,
                                  height: 3*fem,
                                  child: Image.asset(
                                    'assets/servicepage/images/group-1.png',
                                    width: 3*fem,
                                    height: 3*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroup4wmh4tX (F7y9RbPR1ERQ57jqd74wMh)
                      padding: EdgeInsets.fromLTRB(182*fem, 13*fem, 186*fem, 13*fem),
                      width: 414*fem,
                      height: 112*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1954575c),
                            offset: Offset(2*fem, -5*fem),
                            blurRadius: 8.5*fem,
                          ),
                        ],
                      ),
                      child: Container(
                        // group32Yoh (14:635)
                        width: double.infinity,
                        height: 67*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // rectangle18hRh (14:636)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 46*fem,
                                  height: 46*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      borderRadius: BorderRadius.circular(18*fem),
                                      color: Color(0xff8e97fd),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // group31Qqu (14:637)
                              left: 9*fem,
                              top: 12*fem,
                              child: Container(
                                width: 37*fem,
                                height: 55*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // vectorLjZ (14:638)
                                      margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 17*fem),
                                      width: 21.52*fem,
                                      height: 22*fem,
                                      child: Image.asset(
                                        'assets/servicepage/images/vector.png',
                                        width: 21.52*fem,
                                        height: 22*fem,
                                      ),
                                    ),
                                    Text(
                                      // giriTZH (14:639)
                                      'Giriş',
                                      style: SafeGoogleFont (
                                        'Source Sans 3',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.0809999875*ffem/fem,
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