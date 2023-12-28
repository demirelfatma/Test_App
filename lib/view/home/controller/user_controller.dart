import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final medicationsController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    genderController.dispose();
    medicationsController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
