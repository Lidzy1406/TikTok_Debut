import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tiktok_clone/login/constants/text_strings.dart';
import 'package:tiktok_clone/screen/profil/authentification/profile_controller.dart';

import '../../login/constants/colors.dart';
import '../../login/constants/image_strings.dart';
import '../../login/constants/sizes.dart';
import 'model/user_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                         final name = TextEditingController(text: user.name);
                         final surname = TextEditingController(text: user.surname);
                         final email = TextEditingController(text: user.email);
                         final password = TextEditingController(text: user.password);

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  const Image(image: AssetImage(tProfileImage)),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: tPrimaryColor,
                              ),
                              child: const Icon(
                                LineAwesomeIcons.camera,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              // initialValue: user.name,
                              decoration: const InputDecoration(
                                label: Text(tName),
                                prefixIcon: Icon(Icons.person_outline_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: surname,
                              // initialValue: user.surname,
                              decoration: const InputDecoration(
                                label: Text(tSurname),
                                prefixIcon: Icon(Icons.person_outline_sharp),
                              ),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: email,
                              // initialValue: user.email,
                              decoration: const InputDecoration(
                                label: Text(tEmail),
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              // obscureText: true,
                              controller: password,
                              decoration: const InputDecoration(
                                label: Text(tPassword),
                                prefixIcon: Icon(Icons.fingerprint),
                                
                              ),
                            ),
                            const SizedBox(
                              height: tFormHeight,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                      email: email.text.trim(), 
                                      password: password.text.trim(), 
                                      name: name.text.trim(), 
                                      surname: surname.text.trim(),
                                      );

                                      await controller.updateRecord(userData);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: tPrimaryColor,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text(
                                    tEditProfile,
                                    style: TextStyle(color: tDarkColor),
                                  )),
                            ),
                            const SizedBox(
                              height: tFormHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(TextSpan(
                                    text: tJoined,
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: tJoinedAt,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ])),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.redAccent.withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none),
                                    child: const Text(tDelete)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
