import 'package:flutter/material.dart';
import 'package:project_adi/core/constant/navigation/navigation_constant.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute get instance {
    return _instace ??= NavigationRoute._init();
  }

  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.home:
     //   return normalNavigate(const HomeView());
      case NavigationConstant.language:
     //    return normalNavigate(LanguagePage());


      default:
        return normalNavigate(const Text("Not found"));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
