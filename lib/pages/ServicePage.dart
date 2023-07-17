import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:organize_isler/pages/HomePage.dart';
import 'package:organize_isler/pages/ProfilePage.dart';
import 'package:organize_isler/pages/UserMessagesPages.dart';
import 'package:organize_isler/utils/utils.dart';
import 'package:transparent_image/transparent_image.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late Stream<QuerySnapshot> _companiesStream;
  late String selectedCity;

  @override
  void initState() {
    super.initState();
    _companiesStream = Stream<QuerySnapshot>.empty();
    getUserCity();
  }

  Future<void> getUserCity() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      selectedCity = userSnapshot['city'] as String;
      _companiesStream = FirebaseFirestore.instance
          .collection('users')
          .where('userType', isEqualTo: 'company')
          .where('city', isEqualTo: selectedCity)
          .snapshots();
    });
  }

  @override
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Senin için buradayız,',
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                      color: Color(0xff3f414e),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Organizasyon firmalarını senin için listeledim, işte tam burada!',
                    style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      height: 1.2575,
                      color: Color(0xffa1a4b2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Container(
                width: screenWidth,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _companiesStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data == null ||
                        snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('No companies found.'),
                      );
                    }

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var company = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                        return FutureBuilder<String>(
                          future: _getCompanyProfilePicture(company['userId']),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            if (snapshot.hasError || snapshot.data == null) {
                              return GestureDetector(
                                onTap: () {
                                  // Şirketin sayfasına gitmek için gerekli kodu burada ekle
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(
                                        userId: company['userId'],
                                        companyName: company['companyName'],
                                        category: company['category'],
                                        profilePicture: '',
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 200,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          company['companyName'] as String,
                                          style: TextStyle(
                                            fontFamily: 'Source Sans 3',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return GestureDetector(
                              onTap: () {
                                // Şirketin sayfasına gitmek için gerekli kodu burada ekle
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      userId: company['userId'],
                                      companyName: company['companyName'],
                                      category: company['category'],
                                      profilePicture: snapshot.data!,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 200,
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 170,
                                      width: 170,
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: snapshot.data!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      company['companyName'] as String,
                                      style: TextStyle(
                                        fontFamily: 'Source Sans 3',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 195),
              child: SizedBox(
                width: screenWidth * 0.9,
                height: 95 * fem,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/servicepage/images/group-19.png',
                        width: 378 * fem,
                        height: 95 * fem,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 15 * fem,
                      top: 22,
                      child: GestureDetector(
                        onTap: () {
                          // En beğenilenler sayfasına gitmek için gerekli kodu burada ekle
                          print('en beğenilenler');
                        },
                        child: Text(
                          'En beğenilenler',
                          style: TextStyle(
                            fontFamily: 'Source Sans 3',
                            fontSize: 34 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3500000449 * ffem / fem,
                            color: Color(0xffff7e9d),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 25),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // En beğenilenler sayfasına gitmek için gerekli kodu burada ekle
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFF8E97FD),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'Seçimi Değiştir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Mesajlar sayfasına gitmek için gerekli kodu burada ekle
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserMessagesPage(currentUserId: FirebaseAuth.instance.currentUser!.uid)),
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFF8E97FD),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'Mesajlar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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

  Future<String> _getCompanyProfilePicture(String userId) async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('companyProfilePictures')
          .child('$userId.jpg');
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error retrieving image URL: $e');
      return ''; // Return an empty string on error
    }
  }
}