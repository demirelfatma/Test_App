import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_adi/view/home/service/auth_service.dart';
import 'package:project_adi/view/home/view/home_view.dart';
import 'package:project_adi/view/home/view/user_registration.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Lütfen e-posta ve şifre giriniz");
      return;
    }

    var user = await AuthService().signIn(email, password);
    if (user != null) {
      // Başarılı giriş durumunda yönlendirme yapabilirsiniz
      Get.to(HomePageScreen());
    } else {
      _showErrorDialog("Kullanıcı bulunamadı veya hatalı şifre");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hata"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kapat"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: emailController, // Email controller'ını kullan
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: passwordController, // Şifre controller'ını kullan
                      decoration: const InputDecoration(
                        labelText: 'Şifre',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true, // Şifre gizlensin
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Giriş Yap",
                        style: TextStyle(
                          fontSize: 20, color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), backgroundColor: const Color.fromARGB(255, 88, 0, 143),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        await _signIn(); // Giriş fonksiyonunu çağır
                      },
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Hesabınız yok mu?'),
                        TextButton(
                          onPressed: () {
                            Get.to(Deneme());
                          },
                          child: const Text('Kayıt Ol'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
