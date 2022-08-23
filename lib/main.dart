
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veregoodapps/homeScreen.dart';


import 'Screens/splash_screen.dart';
import 'auth_file/auth_controller.dart';
import 'controler/controller.dart';

import 'helper/shared_perferences_helper.dart';
import 'language.dart';





void main() async{
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




        // FutureBuilder<bool>(
        //     future: _hasVisitedOnboarding(),
        //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
        //     !snapshot.hasData
        //         ? CircularProgressIndicator(),
        //         : snapshot.data!
        //         ? FutureBuilder<bool>(
        //       future: _isUserLoggedIn(context),
        //       builder: (BuildContext context,
        //           AsyncSnapshot<bool> snapshot) =>
        //       !snapshot.hasData
        //           ? FullScreenLoader()
        //           : snapshot.data!
        //           ? Home()
        //           : Login(),
        //     )
        //         : Login()),
        // routes: {
        //   // Home.routeName: (ctx) => Home(),
        //   // Login.routeName: (ctx) => Login(),
        //   // OtpScreen.routeName: (ctx) => OtpScreen(),
        //   // SignUp.routeName: (ctx) => SignUp(),
        //   // ProductList.routeName: (ctx) => ProductList(),
        //   // ProductDetails.routeName: (ctx) => ProductDetails(),
        //   // PreviousOrders.routeName: (ctx) => PreviousOrders(),
        //   // FavoriteProducts.routeName: (ctx) => FavoriteProducts(),
        //   // MyDeliveries.routeName: (ctx) => MyDeliveries(),
        //   // ManageAddress.routeName: (ctx) => ManageAddress(),
        //   // OurStory.routeName: (ctx) => OurStory(),
        //   // WhyUs.routeName: (ctx) => WhyUs(),
        // },
  )
      );
}

//
// Future<bool> _hasVisitedOnboarding() async =>
//     (await SharedPreferencesHelper.getValue(
//         SharedPreferencesHelper.onboardingVisited))
//         .isNotEmpty;
//
//
// Future<bool> _isUserLoggedIn(BuildContext context) async {
//   checkForUpdates(context);
//
//   if ((await SharedPreferencesHelper.getValue(SharedPreferencesHelper.token))
//       .isNotEmpty) {
//     http.get(urls.signup, {}).then((response) {
//       SharedPreferencesHelper.setMembershipFlag(
//           response['responseData']['user']['doesHoldMembership']);
//       SharedPreferencesHelper.setIsEmailVerified(
//           response['responseData']['user']['isEmailVerified']);
//     });
//     return true;
//   }
//   return false;
// }
//
//
//
// void checkForUpdates(BuildContext context) {
//   http.get(
//     urls.version + '?versionName=' + APP_VERSION,
//     {},
//   ).then((response) {
//     if (!response['responseData']['isLatest'] &&
//         response['responseData']['updateType'] == 'MANDATORY') {
//       String updateDetails = '';
//       var updateDetailsList = (response['responseData']['updateDetails']
//       ['updateFeatures'] as List<dynamic>)
//           .map((e) => '$e')
//           .toList();
//       updateDetailsList.forEach((element) {
//         updateDetails = updateDetails + element + '\n';
//       });
//       displayMessageWithAction(
//           context,
//           "This is mandatory update and includes following features:\n$updateDetails",
//               () => StoreRedirect.redirect()
//       );
//     }
//   }).catchError((error,) {});
// }


