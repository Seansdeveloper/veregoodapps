import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/login.dart';

import '../controler/controller.dart';
import '../homeScreen.dart';
import '../screens/home_screen/home.dart';
import '../screens/mobile_authitcation_screen/otp_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late String verifirdId;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);


    // firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);


    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => const LoginScreen());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => HomeScreen(0));
  //   }
  // }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomeScreen(0));
    }
  }


  Future<void> OtpVerified(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verifirdId, smsCode: otp);
   await FirebaseAuth.instance
      .signInWithCredential(credential)
      .then((value) {
                  print(value.user);
                  // Get.offAll(() => HomeScreen(0));
                }).catchError((onError) {
                  print(onError.toString());
                  Get.snackbar(
                    "Error",
                    onError.toString(),
                    snackPosition: SnackPosition.BOTTOM,
                  );

                });
  }




  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }


  void MobileAuthication(String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),

          codeSent:
              (String verificationId, int? forceResendingToken) {
                verifirdId=verificationId;
                Get.to(() => OtpPage());
            print(
                'Please check your phone for the verification code.');

          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("verification code: " + verificationId);
            verifirdId = verificationId;
          },
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await auth.signInWithCredential(phoneAuthCredential);
            print("verificationCompleted");

          }, verificationFailed: (FirebaseAuthException error) {
        Get.snackbar(
          "something is wrong ",
          "verfication faild",
          snackPosition: SnackPosition.BOTTOM,
        );

      });
    } catch (e) {
      Get.snackbar(
          "something is wrong ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );

    }
  }



















  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await auth.signOut();
  }
}