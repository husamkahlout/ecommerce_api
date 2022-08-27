import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static SpHelper spHelper = SpHelper();

  SharedPreferences? sharedPreferences;
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveToken(String token) {
    sharedPreferences!.setString('token', token);
  }

  String? getToken() {
    return sharedPreferences!.getString('token');
  }

  deleteToken(){
    sharedPreferences!.remove("token");
  }
}
