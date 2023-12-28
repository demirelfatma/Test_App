import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:project_adi/core/extension/context_extension.dart';
import 'package:project_adi/view/home/model/home_view_model.dart';
import 'package:project_adi/view/home/view/home_view.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
   Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 42, 105),
        body: buildBody(context),
      ),
    );
  }
        /*const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'English',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20), // Aralık bırakmak için boşluk ekledik.
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Türkçe',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }*/
}

 Widget buildBody(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Card(
          margin: EdgeInsets.all(25),
          color: Colors.transparent,
          elevation: 1,
          child: Padding(padding: EdgeInsets.all(8),child: Column(
            children: [
              Text("Uygulama içerisinde Kullanmak İstediğiniz Dili Seçiniz.", style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,),),
              Text("(Select the Language You Want to Use in the Application.)", style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,),)
            ],
          )),
          ),
        SizedBox(height: AppBar().preferredSize.height + 20),
        const SizedBox(height: 25),
        languageControl(context, viewModel),
        const SizedBox(height: 50),
      ],
    );
  }
Widget languageControl(BuildContext context, HomeViewModel viewModel){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
          // ignore: sort_child_properties_last
          child: Text("English", style: context.textThem.titleLarge?.copyWith(color: Colors.white, fontSize: 16),
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.red),
          padding: const EdgeInsets.all(15),
          ),
          onTap: () {
            Get.updateLocale(const Locale("en","US"));
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePageScreen()),
            );
          },
          ),
          const SizedBox(width: 10,),
          InkWell(
          child: Container(
          // ignore: sort_child_properties_last
          child: Text("Türkçe", style: context.textThem.titleLarge?.copyWith(color: Colors.white, fontSize: 16),
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.red),
          padding: const EdgeInsets.all(15),
          ),
          onTap: () {
            Get.updateLocale(const Locale("tr","TR"));
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePageScreen()),
            );
          },
          )
      ],
    );
  }