import 'package:flutter/material.dart';

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
    // Add the other 78 cities here
    'Yozgat',
    'Zonguldak',
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
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Colors.deepPurpleAccent,
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
}