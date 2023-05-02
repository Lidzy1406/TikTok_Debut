import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/login/authentication/authentication.dart';
import 'package:tiktok_clone/login/authentication/user_repository.dart';
import 'package:tiktok_clone/screen/profil/model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  Future<List<UserModel>> getAllUser() async =>
     await _userRepo.allUser();
  

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
