
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/homeScreen.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/login.dart';

import '../generated/assets.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
   Get.off(()=>LoginScreen());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Opacity(
                    opacity: opacity.value,
                    child: new Image.asset(Assets.assetsApplogo)),
              ),
              Center(
                child: RichText(
                  text:  TextSpan(
                      style:  TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
                      children: [
                        TextSpan(text: 'Powered by'.tr, style:  TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:' Aaitpro'.tr,
                            style:const  TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),

      ),
    );
  }
}
