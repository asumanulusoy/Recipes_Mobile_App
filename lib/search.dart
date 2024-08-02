import 'dart:math';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/comment.dart';
import 'package:myapp/login.dart';
import 'package:myapp/navbar.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _randomFoodImage = '';

  @override
  void initState() {
    super.initState();
    _setRandomFoodImage(); // Başlangıçta rastgele bir resim belirle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: HexColor('#F5F5F5'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Bugün Ne Yesem?',
              style: GoogleFonts.pacifico(
                fontSize: 40.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 350,
                  height: 400,
                  child: Image.asset(
                    _randomFoodImage,
                    fit: BoxFit.contain, // Resmin sığdırılma modu
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: OutlinedButton(
              onPressed: _setRandomFoodImage,
              child:
                  const Text('Değiştir', style: TextStyle(color: Colors.black)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: Colors.black,
                    width: 2.0), // Kenarlık rengi ve kalınlığı
              ),
            ),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 1) {
            // Current screen
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogInPage()),
            );
          }
        },
      ),
    );
  }

  void _setRandomFoodImage() {
    // Rastgele bir yemek resmi seçmek için bir liste oluştur
    final List<String> foodImages = [
      'lib/assets/menemen.jpeg',
      'lib/assets/pankek.png',
      'lib/assets/omlet.jpeg',
      'lib/assets/salata.jpeg',
      'lib/assets/mantı.jpeg',
      'lib/assets/karnabahar.jpeg',
      'lib/assets/kofte.jpeg',
      'lib/assets/makarna.jpeg',
      'lib/assets/tavuk.jpeg',
    ];

    // Rastgele bir resim seçmek için random bir indeks al
    final Random random = Random();
    final int randomIndex = random.nextInt(foodImages.length);

    // Seçilen rastgele resmi ayarla ve setState kullanarak yeniden çiz
    setState(() {
      _randomFoodImage = foodImages[randomIndex];
    });
  }
}
