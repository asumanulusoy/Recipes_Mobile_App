import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //Uygulamanın ana sınıfı
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //Hata ayıklama modunda üst köşede bulunan etiketi kaldırır.
      title: 'Yemek Uygulaması',
      home:
          const WelcomeScreen(), //Kullanıcının uygulamayı açtığında ilk göreceği ekranı
      theme: ThemeData(
        brightness: Brightness.light, //Uygulamanın tema ayarı
      ),
    );
  }
}
