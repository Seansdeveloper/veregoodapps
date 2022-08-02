import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/login.dart';
import 'package:veregoodapps/screens/mobile_authitcation_screen/profile_page.dart';
import '../controler/controller.dart';
import '../homeScreen.dart';
import '../networking/api_service/api_service.dart';
import '../screens/mobile_authitcation_screen/otp_page.dart';
import '../screens/splash_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late String verifirdId;
 late String Phone;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is coming from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() =>  SplashScreen());
    } else {
      Get.offAll(()=>HomeScreen(0));
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => ProfilePage());
    }
  }




  Future<void> OtpVerified(String otp) async {

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifirdId, smsCode: otp);
      auth.signInWithCredential(credential).then((value) {
        ApiService.createLoginState(Phone);
        print(value.user);
      }).catchError((onError) {
        Get.snackbar(
          "verfication faild",
          "Oops... somethings is wrong",
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
      Phone=phoneNumber;
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout:  Duration(milliseconds: 10000),
          codeSent:
              (String verificationId, int? forceResendingToken) {
                verifirdId = verificationId;
            print(
                'Please check your phone for the verification code.');
            Get.to(() => OtpPage());
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("verification code: " + verificationId);
            verifirdId = verificationId;
          },
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
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