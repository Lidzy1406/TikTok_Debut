import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/login/constants/colors.dart';
import 'package:tiktok_clone/login/constants/image_strings.dart';
import 'package:tiktok_clone/login/constants/sizes.dart';
import 'package:tiktok_clone/login/constants/text_strings.dart';
import 'package:tiktok_clone/login/screens/signup/sign_up_form_widget.dart';
import '../../common_widget/form_header_widget.dart';
import '../login/login_screen.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize + 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignupTitle,
                  subTitle: tSignupSubTitle,
               ),
               SignUpWidget(),
               Column(
                children: [
                  const Text("OR"),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: null,
                      icon: const Image(image: AssetImage(tGooglelogoImage), width: 20.0,), 
                      label: Text(tSignInWithGoogle.toUpperCase())),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const LoginScreen()), 
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: tAlreadyHaveAnAccount ,style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: tLogin.toUpperCase(),style: TextStyle(color: Colors.blue)),
                        ]
                      ))
                    )
                ],
               )
              ],
            ),
          )
          ),
      ),
    );
  }
}


