import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;

  static const String KEY_IS_First_Time = 'key_is_first_time';
  static const String usertoken = 'key_Token';
  static const String useremail = 'key_email';
  static const String userpassword = 'key_password';
  static const String userid = 'key_id';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static clear() async {
    await preferences!.clear();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences?.setBool(KEY_IS_First_Time, isFirstTime);
  }

  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KEY_IS_First_Time);
    if (first == null) {
      return true;
    } else {
      return first;
    }
  }

  static void savetoken(String token) async {
    preferences!.setString(usertoken, token);
  }

  static String? getToken() {
    String? token = preferences!.getString(usertoken);
    if (token == null) {
      return '';
    } else {
      return token;
    }
  }

  static void saveemail(String email) async {
    preferences!.setString(useremail, email);
  }

  static String? getemail() {
    String? email = preferences!.getString(useremail);
    if (email == null) {
      return '';
    } else {
      return email;
    }
  }

  static void savepassword(String password) async {
    preferences!.setString(userpassword, password);
  }

  static String? getpassword() {
    String? password = preferences!.getString(userpassword);
    if (password == null) {
      return '';
    } else {
      return password;
    }
  }

  static void saveid(int id) async {
    preferences!.setInt(userid, id);
  }

  static int? getid() {
    int? id = preferences!.getInt(userid);
    if (id == null) {
      return null;
    } else {
      return id;
    }
  }
}
