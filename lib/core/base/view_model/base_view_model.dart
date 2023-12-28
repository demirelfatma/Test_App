import 'package:flutter/material.dart';
import 'package:project_adi/core/init/navigation_service.dart';

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
  late BuildContext viewModelContext;
  void init();
}
