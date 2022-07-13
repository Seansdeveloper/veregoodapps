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
  bool _flag=false;

  late Animation<double> _myAnimation;
  late AnimationController _controller;
  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'日本','locale': Locale('ja','JP')},
    {'name':'한국어','locale': Locale('ko','KR')},
    {'name':'français','locale': Locale('fr','FR')},
  ];
  updateLanguage(Locale locale){
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
      // bottomNavigationBar: RichText(
      //   textAlign: TextAlign.center,
      //   text: TextSpan(
      //       style: TextStyle(
      //         color: Theme.of(context).textTheme.bodyText1?.color,
      //       ),
      //       children: [
      //         TextSpan(
      //             text: 'Powered by'.tr,
      //             style: const TextStyle(fontWeight: FontWeight.bold)),
      //         TextSpan(
      //             text: 'saurav singh'.tr,
      //             style: const TextStyle(fontWeight: FontWeight.bold))
      //       ]),
      // ),
      body: Stack(
        children: [
          Positioned.fill(child: Align(alignment: Alignment.topCenter, child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 90
            ),
            decoration: BoxDecoration(color: Color.fromRGBO(240, 207, 3, 1,),borderRadius: BorderRadius.all(Radius.circular(20))),
          ),),),
          Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.only(left: 20,right: 20,top:10),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              color: Theme.of(context).backgroundColor,
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child:SizedBox(
                    width: 40,
                    child: InkWell(
                      onTap: () {
                        buildLanguageDialog(context);
                      },
                      child:  Image.asset(Assets.assetsLanguage,),
                      // Lottie.asset(Assets.assetsCheck, controller: _controller,
                      //   onLoaded: (composition) {
                      //     // Configure the AnimationController with the duration of the
                      //     // Lottie file and start the animation.
                      //     _controller
                      //       ..duration = composition.duration
                      //       ..forward();
                      //   },),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(Assets.assetsAppicon,height: 150,width: 150,),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login".tr,
                  style: TextStyle(
                      fontSize: 26.0,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Text(
                  "MOBILE".tr,
                  style: TextStyle(
                      letterSpacing: 0.7,
                      fontSize: 20,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IntlPhoneField(
                    controller: controller.textController,
                    keyboardType: TextInputType.number,
                    showDropdownIcon: false,
                    focusNode: FocusNode(),
                    // controller: text,
                    flagsButtonMargin: const EdgeInsets.only(left: 5, right: 2),
                    decoration: InputDecoration(
                      labelText: 'Phone Number'.tr,
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).cardColor, width: 2),
                      ),
                    ),
                    onChanged: (phone) {
                      if (kDebugMode) {
                        currentText=phone.completeNumber;
                      }
                    },
                    onCountryChanged: (country) {
                      if (kDebugMode) {
                        print('Country changed to: ${country.name}');
                      }
                    },
                  ),
                ),
                // Form(
                //   child: Padding(
                //       padding: const EdgeInsets.only(top: 20),
                //       child: PinCodeTextField(
                //         appContext: context,
                //         pastedTextStyle: TextStyle(
                //           color: Colors.green.shade600,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         length: 6,
                //         animationType: AnimationType.fade,
                //         validator: (v) {
                //           if (v!.length < 3) {
                //             return "Enter Otp".tr;
                //           } else {
                //             return null;
                //           }
                //         },
                //         pinTheme: PinTheme(
                //             shape: PinCodeFieldShape.box,
                //             borderRadius: BorderRadius.circular(5),
                //             borderWidth: 2,
                //             fieldHeight: 50,
                //             fieldWidth: 50,
                //             activeFillColor:
                //                 Theme.of(context).bottomAppBarColor,
                //             activeColor: Theme.of(context).cardColor,
                //             inactiveFillColor:
                //                 Theme.of(context).bottomAppBarColor,
                //             inactiveColor: Theme.of(context).cardColor,
                //             selectedColor: Theme.of(context).cardColor,
                //             selectedFillColor:
                //                 Theme.of(context).bottomAppBarColor),
                //         cursorColor: Theme.of(context).cardColor,
                //         animationDuration: const Duration(milliseconds: 300),
                //         enableActiveFill: true,
                //         errorAnimationController: errorController,
                //         // controller: otp,
                //         keyboardType: TextInputType.number,
                //         boxShadows: [
                //           BoxShadow(
                //             offset: const Offset(0, -1),
                //             color: Colors.white.withOpacity(0.5),
                //             blurRadius: 1,
                //           )
                //         ],
                //         onCompleted: (v) {
                //           debugPrint("Completed");
                //         },
                //         // onTap: () {
                //         //   print("Pressed");
                //         // },
                //         onChanged: (value) {
                //           debugPrint(value);
                //           setState(() {
                //             currentText = value;
                //           });
                //         },
                //         beforeTextPaste: (text) {
                //           debugPrint("Allowing to paste $text");
                //           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //           //but you can show anything you want here, like your pop up saying wrong paste format or etc
                //           return true;
                //         },
                //       )),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 5),
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: InkWell(
                //       onTap: () {
                //         Get.snackbar('OTP'.tr, 'Otp Resend'.tr,
                //             colorText:
                //                 Theme.of(context).textTheme.bodyText1!.color,
                //             snackPosition: SnackPosition.BOTTOM);
                //       },
                //       child: Text(
                //         "RESEND".tr,
                //         style: const TextStyle(
                //             color: Color(0xFF91D3B3),
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if(currentText.isNotEmpty){
                            authController.MobileAuthication(currentText);
                          }
                         else{
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

                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 30,right:30 ),
                  child: InkWell(
                    onTap: () {
                      authController.signInWithGoogle();
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
                                    color: Colors.black,
                                    fontSize: 18),
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

  buildLanguageDialog(BuildContext context){
    Get.generalDialog(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,) {
      return AlertDialog(
        title: Text('Choose Your Language'.tr),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(child: Text(locale[index]['name']),onTap: (){

                    print(locale[index]['name']);
                    updateLanguage(locale[index]['locale']);

                    _flag=false;
                  },),
                );
              }, separatorBuilder: (context,index){
            return const Divider(
              color: Colors.blue,
            );
          }, itemCount: locale.length
          ),
        ),
      );

    });
  }
}
