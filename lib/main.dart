
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:veregoodapps/homeScreen.dart';
import 'package:veregoodapps/screens/splash_screen.dart';

import 'auth_file/auth_controller.dart';
import 'controler/controller.dart';
import 'language.dart';





void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Stripe.publishableKey = "pk_test_51KPDPESHEdoMqgR5GxG1o3zzw3YypjgUXudHNKkmvQwz3uPkbBXMqfMwBqMcWfllMQJgKerqc27jisA8nZJWUGnB00rhpAEMty"; //"pk_live_51HRl3PHx0vNusgVBNbZD0eWNHA0N8h1XNMjEkMYhZFaWWXeZ4PEtWJu87VEZeKJnprS0tGTdxrmAfMCma5UI4uFA00LGuzwre2";
  // Stripe.merchantIdentifier = 'VereGood';
  // await Stripe.instance.applySettings();
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor:Colors.white,
          cardColor: Colors.black,
          bottomAppBarColor: Colors.white,
          textTheme:const  TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.white),
          ).apply(
            bodyColor: Colors.black,
            displayColor: Colors.blue,
            fontFamily: "Poppins-Regular"
          ),
          /* light theme settings */
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
            backgroundColor: Color(0xff121212),
          cardColor: Colors.white,
          bottomAppBarColor: Colors.black,
            textTheme:const  TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.blue,
        fontFamily: "Poppins-Regular"
      ),

          /* dark theme settings */
        ),
        home: SplashScreen(),
      ));
}










