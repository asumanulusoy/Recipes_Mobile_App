import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart'; // Sayfa geçişlerini yapmak için ekledim
import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/assets/depositphotos_190518818-stock-photo-food-cooking-ingredients-background-on.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: GoogleFonts.pacifico(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                  children: const [
                    TextSpan(
                      text: "Lezzet",
                    ),
                    TextSpan(
                      text: "Diyarı.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType
                            .leftToRightWithFade, // Sayfa geçiş animasyonu belirledik
                        child: LogInPage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white, // Butonun arka plan rengi
                    padding: const EdgeInsets.symmetric(
                      vertical: 10, // Butonun dikey iç boşluğu
                      horizontal: 20, // Butonun yatay iç boşluğu
                    ),
                    elevation: 5,
                    side: const BorderSide(
                        color: Colors.black, width: 1), // Kenarlık
                  ),
                  child: const Text(
                    "Tariflere Göz At!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
