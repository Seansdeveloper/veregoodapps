import 'package:shared_preferences/shared_preferences.dart';

import '../model/CreateProfile.dart';
import '../model/check_user/profile.dart';





class SharedPreferencesHelper {
  static final String onboardingVisited = 'onboarding_visited';
  static final String token = 'token';
  static final String countryCode = '+91';
  static final String mobile = 'mobile';
  static final String email = 'email';
  static final String firstName = 'firstName';
  static final String cart = 'cart';

  static Future<String> getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<CreateProfile> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return CreateProfile(
      profile: Profile(
          name:  prefs.getString(firstName) ?? '',
          countryCode: prefs.getString(countryCode) ?? '',
          email: prefs.getString(email) ?? '',
          mobileNumber: prefs.getString(mobile) ?? ''
      ),
      token: prefs.getString(token) ?? '',
    );
  }

  static Future<bool> setValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> removeValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<void> setValues(Map<String, String> map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    map.forEach((key, value) {
      prefs.setString(key, value);
    });
  }


}
