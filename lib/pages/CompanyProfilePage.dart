import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organize_isler/pages/CompanyEditPage.dart';
import 'package:organize_isler/pages/CompanyMessagesPage.dart';
import 'package:organize_isler/pages/PostListPage.dart';
import 'package:organize_isler/pages/Postpage.dart';
import 'package:organize_isler/pages/CompanyChatPage.dart'; // Import the CompanyChatPage

class CompanyProfilePage extends StatefulWidget {
  @override
  _CompanyProfilePageState createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  bool _liked = false;
  int _likeCount = 0;
  List<String> _comments = [];

  TextEditingController _commentController = TextEditingController();
  bool _isCommenting = false;

  String? companyName;
  String? category;
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    fetchCompanyName();
    fetchCategory();
    fetchProfileImage();
  }

  void fetchCompanyName() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      setState(() {
        companyName = snapshot['companyName'];
      });
    }
  }

  void fetchCategory() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      setState(() {
        category = snapshot['category'];
      });
    }
  }

  void fetchProfileImage() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String profileImagePath = 'companyProfilePages/${currentUser.uid}.jpg';
      firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child(profileImagePath);

      try {
        String downloadURL = await ref.getDownloadURL();
        setState(() {
          profileImageUrl = downloadURL;
        });
      } catch (e) {
        print('Hata: $e');
      }
    }
  }

  void uploadProfileImage(File image) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String profileImagePath = 'companyProfilePages/${currentUser.uid}.jpg';
      firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child(profileImagePath);

      try {
        await ref.putFile(image);
        String downloadURL = await ref.getDownloadURL();
        setState(() {
          profileImageUrl = downloadURL;
        });
      } catch (e) {
        print('Hata: $e');
      }
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      uploadProfileImage(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Arka plan rengini beyaz yap
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: profileImageUrl != null
                ? NetworkImage(profileImageUrl!)
                : AssetImage('assets/companyprofile/images/organizefirma.png') as ImageProvider,
            alignment: Alignment.topCenter, // Resmi üst kısma hizala
            fit: BoxFit.fitWidth, // Resmi genişlik boyutuna sığacak şekilde ölçeklendir
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                  child: InkWell(
                    onTap: () {
                      // Geri butonuna tıklama işlemleri
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompanyEditPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/companyprofile/images/geri.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 308.0,
                right: 120.0,
                child: IconButton(
                  icon: Icon(Icons.message_rounded, color: Colors.red),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyMessagesPage(currentUserId: FirebaseAuth.instance.currentUser!.uid)
                      ),
                    );
                  },
                ),
              ),
              SingleChildScrollView(
                physics: _isCommenting ? NeverScrollableScrollPhysics() : null,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 240.0),
                      child: Column(
                        children: [
                          Text(
                            companyName ?? 'Firma(x)',
                            style: TextStyle(
                              fontFamily: 'Source Sans 3',
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color(0xFF3F414E),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 3),
                            child: Text(
                              category ?? 'kategori',
                              style: TextStyle(
                                fontFamily: 'Source Sans 3',
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Color(0xFF3F414E),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 5),
                            child: Text(
                              '"Hayallerinizin gerçeğe dönüşmesi için buradayız. Siz düşleyin, biz gerçekleştirelim."',
                              style: TextStyle(
                                fontFamily: 'Source Sans 3',
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Color(0xFFA1A4B2),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Beğenme Sayısı:',
                            style: TextStyle(
                              fontFamily: 'Source Sans 3',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF3F414E),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _likeCount.toString(),
                              style: TextStyle(
                                fontFamily: 'Source Sans 3',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF3F414E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PostPage(user: FirebaseAuth.instance.currentUser)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              primary: Color(0xFF8E97FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Gönderi Ekle',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),ElevatedButton(
                            onPressed: () {
                              User? currentUser = FirebaseAuth.instance.currentUser;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostListPage(userId: currentUser!.uid),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              primary: Color(0xFF8E97FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Gönderilerini Gör',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CompanyMessagesPage(currentUserId: FirebaseAuth.instance.currentUser!.uid)
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              primary: Color(0xFF8E97FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Yorumları Gör',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              pickImage();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              primary: Color(0xFF8E97FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Profil Resmini Düzenle',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyEditPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              primary: Color(0xFF8E97FD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Firma Bilgilerini Güncelle',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}


Yorumlar({required List<String> comments}) {}
