import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organize_isler/pages/CompanyProfilePage.dart';
import 'package:organize_isler/reusable_widgets/reusable_widgets.dart';

class CompanyEditPage extends StatefulWidget {
  @override
  _CompanyEditPageState createState() => _CompanyEditPageState();
}

class _CompanyEditPageState extends State<CompanyEditPage> {
  TextEditingController _companyNameTextController = TextEditingController();
  
  String? companyName;
  String? selectedCity;
  String? selectedCategory;
  File? imageFile;

  List<String> categories = [
    'Düğün',
    'Nişan',
    'Yemek',
    'Parti',
    'Baby Shower',
    'Doğum günü'
  ];
  List<String> cities = [
    'Adana',
    'Adıyaman',
    'Afyon',
    'Ağrı',
    'Aksaray',
    'Amasya',
    'Ankara',
    'Antalya',
    'Ardahan',
    'Artvin',
    'Aydın',
    'Balıkesir',
    'Bartın',
    'Batman',
    'Bayburt',
    'Bilecik',
    'Bingöl',
    'Bitlis',
    'Bolu',
    'Burdur',
    'Bursa',
    'Çanakkale',
    'Çankırı',
    'Çorum',
    'Denizli',
    'Diyarbakır',
    'Düzce',
    'Edirne',
    'Elazığ',
    'Erzincan',
    'Erzurum',
    'Eskişehir',
    'Gaziantep',
    'Giresun',
    'Gümüşhane',
    'Hakkâri',
    'Hatay',
    'Iğdır',
    'Isparta',
    'İçel (Mersin)',
    'İstanbul',
    'İzmir',
    'Kahramanmaraş',
    'Karabük',
    'Karaman',
    'Kars',
    'Kastamonu',
    'Kayseri',
    'Kırıkkale',
    'Kırklareli',
    'Kırşehir',
    'Kilis',
    'Kocaeli',
    'Konya',
    'Kütahya',
    'Malatya',
    'Manisa',
    'Mardin',
    'Muğla',
    'Muş',
    'Nevşehir',
    'Niğde',
    'Ordu',
    'Osmaniye',
    'Rize',
    'Sakarya',
    'Samsun',
    'Siirt',
    'Sinop',
    'Sivas',
    'Şanlıurfa',
    'Şırnak',
    'Tekirdağ',
    'Tokat',
    'Trabzon',
    'Tunceli',
    'Uşak',
    'Van',
    'Yalova',
    'Yozgat',
    'Zonguldak'
  ];

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Profil Fotoğrafını Seç!"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                  //get from camera
                    _getFromCamera();
                  },
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Color(0xff8e97fd),
                      ),),
                      Text("Kamera", style: TextStyle(color: Color(0xff8e97fd))),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    //get from gallery
                    _getFromGallery();
                  },
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera,
                          color: Color(0xff8e97fd),
                        ),),
                      Text("Galeri", style: TextStyle(color: Color(0xff8e97fd))),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  void _getFromCamera() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    _userProfilePicture(pickedFile!.path);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }

  void _getFromGallery() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _userProfilePicture(pickedFile!.path);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Organize İşler’e daha\nçok bilgi gerek.',
                                style: TextStyle(
                                  fontFamily: 'Source Sans 3',
                                  fontSize: 38,
                                  fontWeight: FontWeight.w700,
                                  height: 1.35,
                                  color: Color(0xff3f414e),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Organize firmanın bilgilerini detaylandıralım!',
                                style: TextStyle(
                                  fontFamily: 'Source Sans 3',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2575,
                                  color: Color(0xffa1a4b2),
                                ),
                              ),
                            ),
                          ]
                      )
                  ),
                  Positioned(
                    top: 230,
                      left: 107,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       GestureDetector(
                         onTap: ()
                           {
                            //pick profile page
                             _showImageDialog();
                       },
                       child: CircleAvatar(
                         radius: 75,
                         backgroundImage: imageFile == null
                         ?
                         const AssetImage("assets/companyprofile/images/cateringprofile.png")
                             :
                             Image.file(imageFile!).image,
                         backgroundColor: Colors.white,
                       ),
                       ),
                     ],
                  )),
                  Positioned(
                    top: 350,
                      left: 220,
                      child: Icon(Icons.camera_enhance,color: Color(0xff8e97fd),)),
                  Positioned(
                    top: 390,
                    left: 16,
                    right: 16,
                    child: Column(
                      children: [
                        TextField(
                          controller: _companyNameTextController,
                          onChanged: (value) {
                            setState(() {
                              companyName = value;
                              _userCompanyName(companyName);
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Firma Adı',
                            prefixIcon: Icon(Icons.business,color: Color(0xff8e97fd)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff8e97fd)),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff8e97fd)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),],
                    ),
                  ),
                  Positioned(
                    top: 470,
                    left: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCity,
                            hint: Text('Şehir Seçin'),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCity = value;
                                _userCityPressed(value);
                              });
                            },
                            items: cities.map((String city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 10), // row boşluğu
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCategory,
                            hint: Text('Hizmet Kategorisi Seçin'),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCategory = value;
                                _userCategoryPressed(value);
                              });
                            },
                            items: categories.map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 560,
                    left: 50,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                           // imageUrl = await ref.getDownloadURL();
                          print("Firma Bilgileri kaydedildi");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CompanyProfilePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Color(0xff8e97fd),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 95), // Butonun yüksekliğini ayarlamak için padding ekledik
                          minimumSize: Size(0, 0), // Butonun genişliğini ayarlamak için minimumSize'ı tam genişlik olarak belirledik
                        ),
                        child: Text('Kaydet', style: TextStyle(fontSize: 18)),
                      ),
                    ),)
                ],
            ),
        ),
    );
  }

}


void _userCategoryPressed(String? selectedCategory) async {
  print("FİRMA KATEGORİ SEÇTİ");

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    String? category = selectedCategory;

    // Firestore kullanıcı kaydını güncelle
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({'category': category});

    print("Firma kategorisi güncellendi: $category");
  } else {
    print("Hata: Geçerli kullanıcı bulunamadı.");
  }
}

void _userCityPressed(String? selectedCity) async {
  print("KULLANICI ŞEHİR SEÇTİ");

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    String? city = selectedCity;

    // Firestore kullanıcı kaydını güncelle
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({'city': city});

    print("Kullanıcı şehiri güncellendi: $city");
  } else {
    print("Hata: Geçerli kullanıcı bulunamadı.");
  }
}

void _userCompanyName(String? _companyName) async {
  print("FİRMA ADINI GİRDİ");

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    String? companyName = _companyName;

    // Firestore kullanıcı kaydını güncelle
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({'companyName': companyName});

    print("Firma Adını güncellendi: $companyName");
  } else {
    print("Hata: Geçerli kullanıcı bulunamadı.");
  }
}

void _userProfilePicture(String? _picturePath) async {
  print("FİRMA PROFİL FOTOĞRAFINI GÜNCELLEDİ");

  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    String? profilePicturePath = _picturePath;

    // Firestore kullanıcı kaydını güncelle
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({'profilePicture': profilePicturePath});

    print("Firma profil fotoğrafı güncellendi: $profilePicturePath");

    // Firebase Storage'a resmi yükle
    Reference storageRef =
    FirebaseStorage.instance.ref().child('companyProfilePictures').child(currentUser.uid + '.jpg');
    await storageRef.putFile(File(profilePicturePath!));

    print("Resim Firebase Storage'a yüklendi");
  } else {
    print("Hata: Geçerli kullanıcı bulunamadı.");
  }
}
