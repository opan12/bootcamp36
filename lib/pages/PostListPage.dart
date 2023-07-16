import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class PostListPage extends StatefulWidget {
  final String userId;

  PostListPage({required this.userId});

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<String> postUrls = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('userId',
              isEqualTo: widget.userId) // Kullanıcının gönderilerini filtrele
          .get();

      for (final DocumentSnapshot document in snapshot.docs) {
        final imageUrl = document['postContent'];
        setState(() {
          postUrls.add(imageUrl);
        });
      }
    } catch (error) {
      print('Hata: $error');
    }
  }

  Future<Widget> _fetchImage(String imageUrl) async {
    final ref = firebase_storage.FirebaseStorage.instance.refFromURL(imageUrl);
    final url = await ref.getDownloadURL();
    return Image.network(url);
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
                top: 40,
                left: 115,
                child: Text(
                  "Gönderiler",
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
                    SizedBox(height: 50),
                    Expanded(
                      child: ListView.builder(
                        itemCount: postUrls.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                subtitle: FutureBuilder(
                                  future: _fetchImage(postUrls[index]),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<Widget> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Hata: ${snapshot.error}');
                                    } else {
                                      return snapshot.data ?? Container();
                                    }
                                  },
                                ),
                              ),
                              Divider(
                                color: Color(0xFF8E97FD), // Çizgi rengi
                                height: 1, // Çizgi yüksekliği
                                thickness: 2,
                                indent: 30, // Çizgi sol kenar boşluğu
                                endIndent: 30, // Çizgi sağ kenar boşluğu
                              ),
                              SizedBox(height: 4), // Resimler arasında boşluk
                            ],
                          );
                        },
                      ),
                    )
                  ]))
            ])));
  }
}
