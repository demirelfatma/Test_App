import 'package:flutter/material.dart';
import 'package:project_adi/core/constant/app/lottie_constant.dart';
import 'package:project_adi/view/home/view/login_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1700),() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 88, 0, 143), 
      body: Center(
        child: Container(
          child: LottiePathEnum.splash.toWidgetLottie,
        ),
      ),
    );
  }
}
