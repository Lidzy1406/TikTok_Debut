import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/authentication.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  // call this function from Design
  void loginUser(String email, String password) {
  AuthenticationRepository.instance
    .loginUserWithEmailAndPassword(email, password)
    .then((user) {
      // Handle successful login
    })
    .catchError((error) {
      // Handle login error
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    });
}
}
// void loginUser(String email, String password) async {
//   final error = await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
//   if (error != null) {
//     Get.showSnackbar(GetSnackBar(
//       message: error.toString(),
//     ));
//   }
// }







