import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/authentication.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  // call this function from Design
  void loginUser(String email, String password) {
    String? error = AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),
      ));
    }
  }
}
