import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_adi/view/home/view/login_page.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Deneme extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController medicationsController = TextEditingController();

  // ignore: body_might_complete_normally_nullable
  Future<User?> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Kullanıcı oluşturuldu, adı Firestore'a kaydet
      await FirebaseFirestore.instance.collection('person').add({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'age': ageController.text,
        'gender': genderController.text,
        'medications': medicationsController.text,
        'uid': userCredential.user?.uid,
      });

      // Kullanıcı kaydı başarılı, işlemi tamamlayabilirsiniz.
    } catch (e) {
      // Kayıt sırasında bir hata oluştu
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 191, 183, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 191, 183, 255),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/kullanici_ekle.png',
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Kullanıcı Kaydı",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 72, 0, 117),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'Ad',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'Adınızı girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Soyad',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'Soyadınızı girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Yaş',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'Yaşınızı girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-posta',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'E-posta adresinizi girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: genderController,
              decoration: const InputDecoration(
                labelText: 'Cinsiyet',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'Cinsiyetinizi girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: medicationsController,
              decoration: const InputDecoration(
                labelText: 'Kullanmakta Olduğunuz İlaçlar',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'Kullandığınız ilaçları girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Şifre',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 88, 0, 143)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 166, 89, 255)),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 72, 0, 117),
                ),
                hintText: 'Şifrenizi girin',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _register,
              /*  onPressed: () {
                  _register;
                  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
                },*/
                // ignore: sort_child_properties_last
                child: const Text('Kayıt Ol', style: TextStyle(color: Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), backgroundColor: const Color.fromARGB(255, 88, 0, 143),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ),
              TextButton(
                          onPressed: () {
                            Get.to(LoginPage());
                          },
                          child: const Text('Giriş Ekranına Dön'),
                        ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
