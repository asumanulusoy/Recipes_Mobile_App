import 'package:flutter/material.dart';
import 'package:myapp/sign_up.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/database.dart';
import 'package:page_transition/page_transition.dart'; // Sayfa geçişlerini yapmak için ekledik

class LogInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/key.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              controller: emailController,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Giriş işlemini gerçekleştir
                String email = emailController.text;
                String password = passwordController.text;

                // Kullanıcıyı veritabanında kontrol et
                Map<String, dynamic>? user =
                    await DatabaseHelper().getUser(email, password);

                if (user != null) {
                  // Giriş başarılı olduğunda hoş geldiniz alerti göster
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Hoş Geldin ${user['username']}'),
                      content: const Text(
                          'Giriş işlemi başarıyla gerçekleştirildi.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType
                                    .fade, // Sayfa geçiş animasyonu belirledim
                                child: const HomeScreen(),
                              ),
                            );
                          },
                          child: const Text('Tamam'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Hesabınız yok uyarısı göster
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Hata'),
                      content: const Text(
                          'Kayıtlı hesabınız bulunuyor ise email veya şifrenizi kontrol ederek tekrar giriniz.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tamam'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Giriş Yap'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Henüz hesabınız yok mu? "),
                GestureDetector(
                  onTap: () {
                    // Sign Up sayfasına yönlendir
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType
                            .rightToLeftWithFade, // Sayfa geçiş animasyonu belirledik
                        child: SignUpPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Kayıt Olun",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
