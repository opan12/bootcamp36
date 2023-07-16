import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/ServicePage.dart';

class DatePage extends StatefulWidget {
  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  String? selectedCity;
  DateTime? selectedDate;

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
                  'Organize etmek istediğin etkinliği\ndetaylandıralım!',
                  style: TextStyle(
                    fontFamily: 'Source Sans 3',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.2575,
                    color: Color(0xffa1a4b2),
                  ),
                ),
              ),
            ]
          )
          ),
          SizedBox(height: 10),
          Positioned(
            top: 250,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  value: selectedCity,
                  hint: Text('İl Seçin'),
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
              )),
          Positioned(
            top: 320,
            child: Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xfff5f5f9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedDate == null
                      ? 'Tarih Seçin'
                      : 'Seçilen Tarih: ${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}',
                ),
              ),
            ),
          ),),
          Positioned(
            top: 400,
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                if (selectedCity != null && selectedDate != null) {
                  // Appointment creation operations here
                  print('Seçilen İl: $selectedCity');
                  print('Seçilen Tarih: $selectedDate');
                } else {
                  print('İl ve tarih seçimi yapınız.');
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServicePage()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Color(0xff8e97fd),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Butonun yüksekliğini ayarlamak için padding ekledik
                minimumSize: Size(0, 0), // Butonun genişliğini ayarlamak için minimumSize'ı tam genişlik olarak belirledik
              ),
              child: Text('Randevu Oluştur', style: TextStyle(fontSize: 16)),
            ),
          ),)

    ]
    )
        )
    );
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
}