import 'package:flutter/material.dart';
import 'package:myapp/database.dart';
import 'package:myapp/login.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/user.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              controller: emailController,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              controller: passwordController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Kayıt işlemini gerçekleştir
                String username = usernameController.text;
                String email = emailController.text;
                String password = passwordController.text;

                Map<String, dynamic> row = {
                  'username': username,
                  'email': email,
                  'password': password
                };

                int id = await DatabaseHelper().insertUser(row);
                print('Inserted user id: $id');

                // Kayıt işleminden sonra alert göster
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Kayıt Başarılı'),
                    content: Text('Kayıt işlemi başarıyla gerçekleştirildi.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Alert penceresini kapat
                          Navigator.pop(context);
                          // Giriş sayfasına geri dön
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInPage()),
                          );
                        },
                        child: Text('Tamam'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }
}
