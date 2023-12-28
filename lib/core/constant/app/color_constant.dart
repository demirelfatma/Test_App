import 'package:flutter/material.dart';

class ColorsConstant {
  static ColorsConstant? _instace;
  static ColorsConstant get instance {
    _instace ??= ColorsConstant._init();
    return _instace!;
  }

  ColorsConstant._init();

  final primary = const Color.fromRGBO(68, 73, 107, 1);
  //rgb(112, 116, 153)
  final onPrimary = const Color.fromRGBO(112, 116, 153, 1);
  //rgb(85, 90, 125)
  final accent = const Color.fromRGBO(85, 90, 125, 1);
  //#F2CCB8  rgb(242, 204, 184)
  final secondary = const Color.fromRGBO(242, 204, 184, 1);
  //rgb(171, 144, 139)
  final onSecondary = const Color.fromRGBO(171, 144, 139, 1);
/* 
    --primary-100:#C9ADA7;
    --primary-200:#ab908b;
    --primary-300:#69514c;
    --accent-100:#F2CCB8;
    --accent-200:#8e6d5b;
    --text-100:#FFFFFF;
    --text-200:#c4c3c3;
    --bg-100:#44496b;
    --bg-200:#555a7d;
    --bg-300:#707499;
      

 */
}
