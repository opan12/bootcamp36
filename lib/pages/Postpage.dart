import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organize_isler/pages/CompanyProfilePage.dart';

class PostPage extends StatefulWidget {
  final User? user;

  PostPage({required this.user});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<File> selectedImages = [];

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImages.add(File(pickedImage.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  Future<void> _showNotification() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bildirim'),
          content: Text('Gönderileriniz başarıyla paylaşıldı!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyProfilePage(),
                  ),
                );
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadImage() async {
    for (var imageFile in selectedImages) {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child('posts/$fileName.jpg');

      await ref.putFile(imageFile);
      final imageUrl = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('posts').add({
        'userId': widget.user?.uid,
        'postContent': imageUrl,
        'timestamp': DateTime.now(),
      });

      print('Resim yüklendi: $imageUrl');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Resim yüklendi: $imageUrl'),
      ));
    }

    setState(() {
      selectedImages.clear();
    });

    _showNotification();
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
              top: 40,
              left: 90,
              child: Text(
                "Gönderi Ekle",
                style: TextStyle(
                  fontFamily: 'Source Sans 3',
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                  color: Color(0xFF8E97FD),
                ),
              ),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        if (selectedImages.isNotEmpty)
                          Column(
                            children: [
                              for (var i = 0; i < selectedImages.length; i++)
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.file(
                                      selectedImages[i],
                                      height: 200,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _removeImage(i);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              Divider(
                                color: Color(0xFF8E97FD),
                                thickness: 2.0,
                                indent: 16.0,
                                endIndent: 16.0,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0, left: 20),
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Image.asset(
                          'assets/deneme/images/dosyayukleme.png',
                          height: 56,
                          width: 56,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, right: 20),
                      child: GestureDetector(
                        onTap: _uploadImage,
                        child: Container(
                          width: 120,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFF8E97FD),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              'Paylaş',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
          ],
        ),
      ),
    );
  }
}