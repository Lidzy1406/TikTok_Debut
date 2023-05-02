import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/screen/profil/model/user_model.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../controllers/signup_controller.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                label: Text(tName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.surname,
              decoration: const InputDecoration(
                label: Text(tSurname),
                prefixIcon: Icon(Icons.person_outline_sharp),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      name: controller.name.text.trim(),
                      surname: controller.surname.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                    // SignUpController.instance.registerUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
