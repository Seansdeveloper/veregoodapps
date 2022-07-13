import 'package:shared_preferences/shared_preferences.dart';
import '../model/check_user/profile.dart';


class SharedPreferencesHelper {
  static final String onboardingVisited = 'onboarding_visited';
  static final String token = 'token';
  static final String mobile = '9174541807';
  static final String email = 'email';
  static final String firstName = 'firstName';
  static final String countryCode = '+91';

  static final String cart = 'cart';

  static Future<String> getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<Profile> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Profile(
      name: prefs.getString(firstName) ?? '',
      email: prefs.getString(email) ?? '',
      mobileNumber: prefs.getString(mobile) ?? '',
      countryCode: prefs.getString(countryCode)
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
