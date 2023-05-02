import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/login/authentication/user_repository.dart';
import 'package:tiktok_clone/screen/bar.dart';
import 'package:tiktok_clone/screen/profil/model/user_model.dart';

import '../authentication/authentication.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final surname = TextEditingController();

  final userRepo = Get.put(UserRepository());

  // call this function from Design
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    Get.to(() => const BarPage());
  }
}
