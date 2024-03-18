import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper{
  static SharedPreferences? preferences  ;
  CacheHelper._();

  static SharedPreferences? get instance => preferences;
  static init() async =>
      preferences ??= await SharedPreferences.getInstance();

  // static SharedPreferences? get instance => preferences;

  static Future<bool?>saveData({
    required String key,
    required Object value
  })async {
    if(value is String )return await preferences!.setString(key, value);
    if(value is int )return await preferences!.setInt(key, value);
    if(value is bool )return await preferences!.setBool(key, value);
    else if (value is List<String>) {
      return preferences!.setStringList(key, value);
    }
    else if (value is double) {
    return await preferences!.setDouble(key, value);
  }
    return null;
  }




  static T? getValue<T>({
    required String key,
    dynamic onNullVal,
  }) =>
      preferences!.get(key) ?? onNullVal;
  static Future<bool>clearData(){return preferences!.clear();}
  static Future<bool>removeData({required key}){
    return preferences!.remove(key);
  }

}