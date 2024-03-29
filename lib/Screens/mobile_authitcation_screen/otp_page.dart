import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controler/controller.dart';
import '../../controler/text_controller.dart';
import '../../generated/assets.dart';
import '../../responsive/responsive.dart';
import '../home_screen/home.dart';






class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OtpScreen(),
      desktop: OtpScreen(),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  final controller = Get.find<TextController>();
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
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
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Center(
                    child: Image.asset(
                  Assets.assetsAppicon,
                  height: 150,
                  width: 150,
                )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "OTP Verification".tr,
                  style: TextStyle(
                      fontSize: 26.0,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Text(
                  "Enter OTP code send to your number  ".tr +
                      controller.controllerText.value,
                  style: TextStyle(
                      letterSpacing: 0.7,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.5)),
                ),
                Form(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: PinCodeTextField(
                        autoFocus: true,
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "Enter Otp".tr;
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            borderWidth: 0,
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor:
                                Theme.of(context).bottomAppBarColor,
                            activeColor: Theme.of(context).cardColor,
                            inactiveFillColor: Color(0xffF5F5F5),
                            inactiveColor: Color(0xffF5F5F5),
                            selectedColor: Theme.of(context).cardColor,
                            selectedFillColor:
                                Theme.of(context).bottomAppBarColor),
                        cursorColor: Theme.of(context).cardColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        // controller: otp,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: const Offset(0, -1),
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 1,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (currentText.isNotEmpty) {
                            authController.OtpVerified(currentText);
                          } else {
                            Get.snackbar('alert', 'Please enter the otp'.tr,
                                colorText: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                          // Get.to(() => ProfilePage());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(36, 94, 171, 1),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          minimumSize: const Size(200, 50), //////// HERE
                        ),
                        child: Text(
                            "Verify OTP",
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        )),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3,right: 3),
                      child: Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Get.snackbar('OTP'.tr, 'Otp Resend'.tr,
                                colorText:
                                Theme.of(context).textTheme.bodyText1!.color,
                                snackPosition: SnackPosition.BOTTOM);
                          },
                          child: Text(
                            "RESEND".tr,
                            style: const TextStyle(

                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Divider(

                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
