import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/login/screens/signup/signup_screen.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';



class LoginFooterWidget extends StatelessWidget{
  const LoginFooterWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Text("OR"),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: OutlinedButton.icon(
                  //      onPressed: null, 
                  //      icon: Image(image: AssetImage(tGooglelogoImage), width: 20.0,),
                  //      label: Text(tSignInWithGoogle.toUpperCase()),
                  //   ),
                  // ),
                  const SizedBox(
                    height: tFormHeight - 20,
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const SignUpScreen()), 
                    child: Text.rich(
                      TextSpan(
                        text: tDontHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const[
                          TextSpan(
                            text: tSignup,
                            style: TextStyle(color: Colors.blue),
                          )
                         ],
                      ),
                    )),
                ],
              );
  }
  }