import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/EntrancePage.dart';
import 'package:organize_isler/pages/LoginPage.dart';
import 'package:organize_isler/utils/utils.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: EntrancePage(),
        ),
      ),
    );
  }
}

