 import 'package:shared_preferences/shared_preferences.dart';

import '../models/res-models/user_model.dart';


abstract class BaseAuthLocalDataSource {
  Future<void> setUserLoggedIn(String uid);
  Future<void> setLocale(String locale);

  Future<void> removeUser(String uid);

  String? getUser();
  String? getLocale();
  UserAuthModel? getUserModel();
  Future<void> setUserModel(UserAuthModel user);
  Future<void> updateField(String field,dynamic value);
}

class AuthLocalDataSource extends BaseAuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> setUserLoggedIn(String uid) {
    return sharedPreferences.setString('uid', uid);
  }

  @override
  Future<void> removeUser(String uid) {
    return sharedPreferences.remove(uid);
  }

  @override
  String? getUser() {
    return sharedPreferences.getString('uid');
  }

  @override
  UserAuthModel? getUserModel() {
    final jsonString = sharedPreferences.getString('userModel');
    if (jsonString != null) {
      return UserAuthModel.fromJson(jsonString);
    }
    return null;
  }

  @override
  Future<void> setUserModel(UserAuthModel user) async{
    final jsonString = userAuthModelToJson(user);
      await sharedPreferences.setString('userModel', jsonString);
  }
  @override
  Future<void> updateField(String field, dynamic value) async {
    final user = getUserModel();
    if (user != null) {
      switch (field) {
        case 'phone':
          user.setPhone(value);
          break;
      }
      await setUserModel(user);
    }
  }
  @override
  getLocale() async {
    return sharedPreferences.getString('selected_locale');
   }

  @override
  Future<void> setLocale(String locale) {

    return sharedPreferences.setString('selected_locale', locale);
  }


}
