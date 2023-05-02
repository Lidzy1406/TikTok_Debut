import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/login/constants/colors.dart';
import 'package:tiktok_clone/login/constants/sizes.dart';
import 'package:tiktok_clone/login/constants/text_strings.dart';
import 'package:tiktok_clone/login/screens/signup/signup_screen.dart';
import '../constants/image_strings.dart';
import 'login/login_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
   return Scaffold(
    backgroundColor: tPrimaryColor,
    body: Container(
      padding: EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(tWelcomeScreenImage), height: height * 0.6,),
          Column(
            children: [
               Text(tWelcomeTitle,
                style: Theme.of(context).textTheme.displayMedium,),
               Text(tWelcomeSubTitle,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: Text(tLogin.toUpperCase()))),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SignUpScreen()), 
                  child: Text(tSignup.toUpperCase()))),
            ],
          )
        ]),
    ),
   );
 }
}
