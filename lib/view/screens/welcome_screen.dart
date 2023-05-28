import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var height = MediaQuery.of(context).size.height;
   return Scaffold(
    backgroundColor: Colors.blueAccent,
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
                  onPressed: () => Get.to(() =>  LoginScreen()),
                  child: Text(tLogin.toUpperCase()))),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SignUpScreen()), 
                  child: Text(tSignup.toUpperCase()))),
            ],
          )
        ]),
    ),
   );
 }
}
