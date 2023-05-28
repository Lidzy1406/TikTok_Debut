import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tiktok_debut/view/screens/update_profile_screen.dart';
import 'package:tiktok_debut/view/screens/user_management.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../controller/auth_controller.dart';
import '../../controller/profile_controller.dart';
import '../widgets/Profil_menu.dart';
// import '../../login/authentication/authentication.dart';

class ProfileScreen extends StatefulWidget {
  String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  void initState() {
    // TODO: implement initState
    super.initState();

    profileController.updateUseId(widget.uid);
  }

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'FRENCH', 'locale': Locale('fr', 'FR')}
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialgo(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('langage'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            print(locale[index]['name']);
                            updateLanguage(locale[index]['locale']);
                          },
                          child: Text(locale[index]['name'])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          var isDark =
              MediaQuery.of(context).platformBrightness == Brightness.dark;
          return Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //     onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
              title: Text('@${controller.user["name"]}'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.snackbar("Switch to moon", "Put phone on dark mode");
                    },
                    icon: Icon(
                        isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: controller.user['profilePic'],
                            fit: BoxFit.contain,
                            height: 100,
                            width: 100,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
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
                              LineAwesomeIcons.alternate_pencil,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 10),
                    // Text(
                    //   tProfileHeading,
                    //   style: Theme.of(context).textTheme.displayMedium,
                    // ),
                    // Text(
                    //   tProfileSubHeading,
                    //   style: Theme.of(context).textTheme.bodyLarge,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.user['followers'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('follow'.tr,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.user['following'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Following'.tr,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.user['likes'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Likes'.tr,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const UpdateProfileScreen()),
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
                      height: 30,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),

                    //--MENU
                    ProfileMenuWidget(
                      title: 'lang'.tr,
                      icon: LineAwesomeIcons.cog,
                      onPress: () {
                        builddialgo(context);
                      },
                    ),
                    ProfileMenuWidget(
                      title: 'tUser'.tr,
                      icon: LineAwesomeIcons.user_check,
                      onPress: () {
                        print("User Management pressed!");
                        Get.to(() => UserManagement());
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ProfileMenuWidget(
                    //     title: "informations",
                    //     icon: LineAwesomeIcons.info,
                    //     onPress: (){}),
                    ProfileMenuWidget(
                        title: 'tLogoutDialogHeading'.tr,
                        icon: LineAwesomeIcons.alternate_sign_out,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          authController.signOut();
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
