import 'package:flutter/material.dart';

class CompanyProfilePage extends StatefulWidget {
  @override
  _CompanyProfilePageState createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  bool _liked = false;
  int _likeCount = 0;
  List<String> _comments = [];

  TextEditingController _commentController = TextEditingController();
  bool _isCommenting = false; // Yorum yapılıyor mu kontrolü için bir değişken

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/companyprofile/images/organizefirma.png'),
          fit: BoxFit.cover,
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
              physics: _isCommenting
                  ? NeverScrollableScrollPhysics()
                  : null, // Yorum yapılıyorsa diğer elementlerin kaymasını engellemek için
              child: Padding(
                padding: EdgeInsets.only(
                  top: 250.0,
                  bottom: _isCommenting
                      ? 100.0
                      : 0.0, // Yorum yapılıyorsa TextField'in yüksekliği kadar bottom padding ekle
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Firma(A)',
                      style: TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color(0xFF3F414E),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '(Düğün)',
                        style: TextStyle(
                          fontFamily: 'Source Sans 3',
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Color(0xFFA1A4B2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        '"Hayallerinizin gerçeğe dönüşmesi için buradayız. Siz düşleyin, biz gerçekleştirelim."',
                        style: TextStyle(
                          fontFamily: 'Source Sans 3',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xFFA1A4B2),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
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
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        bottom:
                        50.0, // Beğenme sayısı ve üstündekilerin konumunu yukarı taşımak için padding eklendi
                      ),
                      child: TextField(
                        controller: _commentController,
                        onTap: () {
                          setState(() {
                            _isCommenting = true; // Yorum yapılıyor
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
                                _isCommenting =
                                false; // Yorum yapma işlemi bitti
                              });
                            },
                            icon: Icon(Icons.send),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        bottom: 80.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Yorumları sola hizalama
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Yorumlar(comments: _comments),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal:
                                  15), // Butonun iç boşluğunu ayarla
                              primary: Color(
                                  0xFF8E97FD), // Butonun arka plan rengini ayarla
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Köşeleri oval hale getir
                              ),
                            ),
                            child: Text(
                              'Yorumları Gör',
                              style: TextStyle(
                                  fontSize:
                                  18), // Butonun metin boyutunu ayarla
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Gönderi ekleme işlemleri
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal:
                                  15), // Butonun iç boşluğunu ayarla
                              primary: Color(
                                  0xFF8E97FD), // Butonun arka plan rengini ayarla
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Köşeleri oval hale getir
                              ),
                            ),
                            child: Text(
                              'Gönderi Ekle',
                              style: TextStyle(
                                  fontSize:
                                  18), // Butonun metin boyutunu ayarla
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !_isCommenting, // Yorum yapılıyorsa giriş butonunu gizle
              child: Positioned(
                bottom: 0.0,
                child: InkWell(
                  onTap: () {
                    // Giriş butonuna tıklama işlemleri
                  },
                  child: Image.asset(
                    'assets/companyprofile/images/giriş.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20.0),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _liked = !_liked;
                if (_liked) {
                  _likeCount++;
                } else {
                  _likeCount--;
                }
              });
            },
            child: Image.asset(
              _liked
                  ? 'assets/companyprofile/images/beğenme2.png'
                  : 'assets/companyprofile/images/beğenme.png',
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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
