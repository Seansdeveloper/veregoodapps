import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:veregoodapps/homeScreen.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/profile_page.dart';

import '../../controler/controller.dart';
import '../../controler/text_controller.dart';
import '../../generated/assets.dart';
import '../../responsive/responsive.dart';
import '../home_screen/home.dart';
import '../onborading_screen/onborading_screen.dart';
import 'otp_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileLoginScreen(),
      desktop: MobileLoginScreen(),
    );
  }
}

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  final controller = Get.put(TextController());
  final controllers = Get.find<TextController>();
  bool _flag = false;

  late Animation<double> _myAnimation;
  late AnimationController _controller;
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': '日本', 'locale': Locale('ja', 'JP')},
    {'name': '한국어', 'locale': Locale('ko', 'KR')},
    {'name': 'français', 'locale': Locale('fr', 'FR')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(36, 94, 171, 1),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 90),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(
                      240,
                      207,
                      3,
                      1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(() => HomeScreen(0));
                        },
                        child: Text("Skip".tr)),
                    SizedBox(
                      width: 40,
                      child: InkWell(
                        onTap: () {
                          buildLanguageDialog(context);
                        },
                        child: Image.asset(
                          Assets.assetsLanguage,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.assetsAppicon,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login".tr,
                  style: TextStyle(
                      fontSize: 26.0,
                      letterSpacing: 0.7,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IntlPhoneField(
                    controller: controller.textController,
                    keyboardType: TextInputType.number,
                    showDropdownIcon: false,

                    // controller: text,
                    flagsButtonMargin: const EdgeInsets.only(left: 5, right: 2),
                    decoration: InputDecoration(
                      labelText: 'Phone Number'.tr,
                      hintText: "Enter the phone Number",
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      fillColor: Color(0xffF5F5F5),
                        filled: true,
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      border:  OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffF5F5F5), width: 0),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffF5F5F5), width: 0),
                          borderRadius: BorderRadius.circular(14)
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffF5F5F5), width: 0),
                          borderRadius: BorderRadius.circular(14)
                      ),
                      focusColor: Color(0xffF5F5F5),
                    ),
                    onChanged: (phone) {
                      currentText = phone.completeNumber;
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ${country.name}');
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (currentText.isNotEmpty) {
                            authController.MobileAuthication(currentText);
                          } else {
                            Get.snackbar(
                              "Alert",
                              "Please enter the phone number",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                          //   Get.to(() => OtpPage());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(36, 94, 171, 1),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: const Size(240, 50), //////// HERE
                        ),
                        child: Text(
                          "Send Otp".tr,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )),
                  ),
                ),
                Spacer(),
                Divider(
                  thickness: 1,
                  color: Color(0xffE7E7E7)
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40,bottom: 30),
                  child: InkWell(
                    onTap: () {
                      // authController.signInWithGoogle();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(245, 245, 245, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/google.png",
                            height: 30,
                            width: 50,
                          ),
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Google Sign In".tr,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildLanguageDialog(BuildContext context) {
    Get.generalDialog(pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return AlertDialog(
        title: Text('Choose Your Language'.tr),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    child: Text(locale[index]['name']),
                    onTap: () {
                      print(locale[index]['name']);
                      updateLanguage(locale[index]['locale']);

                      _flag = false;
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length),
        ),
      );
    });
  }
}
