import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/ChatPage.dart';
import 'package:organize_isler/pages/PostListPage.dart';
import 'package:organize_isler/pages/ServicePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  final String userId;
  final String companyName;
  final String category;
  final String profilePicture;

  ProfilePage({required this.userId, required this.companyName, required this.category, required this.profilePicture});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _liked = false;
  int _likeCount = 0;
  List<String> _comments = [];

  TextEditingController _commentController = TextEditingController();
  bool _isCommenting = false;

  @override
  void initState() {
    super.initState();
    _fetchLikeCount();
  }

  Future<void> _fetchLikeCount() async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .get();

    if (docSnapshot.exists) {
      final userData = docSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _likeCount = userData['likeCount'] ?? 0;
      });
    }
  }

  Future<void> _updateLikeCount(int newLikeCount) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .update({'likeCount': newLikeCount});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Arka plan rengini beyaz yap
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.profilePicture),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicePage(),
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
              SingleChildScrollView(
                physics: _isCommenting ? NeverScrollableScrollPhysics() : null,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 250.0),
                      child: Column(
                        children: [
                          Text(
                            widget.companyName,
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
                              widget.category,
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
                          IconButton(
                            onPressed: _liked
                                ? null
                                : () {
                              setState(() {
                                _likeCount++;
                                _updateLikeCount(_likeCount);
                                _liked = true;
                              });
                            },
                            icon: Icon(
                              _liked ? Icons.favorite : Icons.favorite_border,
                              color: _liked ? Colors.red : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: TextField(
                        controller: _commentController,
                        onTap: () {
                          setState(() {
                            _isCommenting = true;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Yorum yap...',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _comments.add(_commentController.text);
                                _commentController.clear();
                                _isCommenting = false;
                              });
                            },
                            icon: Icon(Icons.send),
                          ),
                        ),
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
                                MaterialPageRoute(
                                  builder: (context) => PostListPage(userId: widget.userId),
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
                              'Gönderileri Gör',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Yorumlar(comments: _comments),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    currentUserId: FirebaseAuth.instance.currentUser!.uid,
                                    otherCompanyId: widget.userId,
                                    otherCompanyName: widget.companyName,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Mesaj',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
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