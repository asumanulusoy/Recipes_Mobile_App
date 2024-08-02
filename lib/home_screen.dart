import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_container.dart';
import 'meal_screen.dart';
import 'navbar.dart';
import 'login.dart';
import 'search.dart';
import 'comment.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Geri tuşuna basıldığında WelcomeScreen'e git
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
        // Geri tuşunun işlevini iptal etmek için false döndür
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Lezzet Diyarı',
            style: GoogleFonts.pacifico(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildMenuListItem(
                    context,
                    'Kahvaltı',
                    'lib/assets/breakfast.png',
                    'breakfast',
                  ),
                  _buildMenuListItem(
                    context,
                    'Öğle Yemeği',
                    'lib/assets/fried-rice.png',
                    'lunch',
                  ),
                  _buildMenuListItem(
                    context,
                    'Akşam Yemeği',
                    'lib/assets/dinner.png',
                    'dinner',
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: 1,
          onTap: (int index) {
            if (index == 0) {
              // Burada yapılacak bir işlem yoksa
              // geri tuşuna basıldığında önceki sayfaya dönülecek.
            } else if (index == 1) {
              // Kullanıcı arama öğesine tıkladığında, SearchScreen sayfasına yönlendirilir.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            } else if (index == 2) {
              //Kullanıcı kayıt ol öğesine tıkladığında, SignUpPage sayfasına yönlendirilir.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage()),
              );
            } else if (index == 3) {
              //Kullanıcı kayıt ol öğesine tıkladığında, SignUpPage sayfasına yönlendirilir.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInPage()),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildMenuListItem(
    BuildContext context,
    String content,
    String imagePath,
    String mealType,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealScreen(mealType: mealType),
          ),
        );
      },
      child: MyContainer(
        content: content,
        imagePath: imagePath,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
