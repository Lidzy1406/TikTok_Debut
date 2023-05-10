import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:tiktok_debut/view/screens/auth/login_screen.dart';

import 'constants.dart';
import 'controller/auth_controller.dart';
import 'view/screens/auth/login_screen.dart';
//import 'view/screens/auth/signup_screen.dart';

void main()  async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp().then((value){
   Get.put(AuthController());

 });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok ICT ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor: backgroundColor
      ),
      home: LoginScreen(),
    );
  }
}