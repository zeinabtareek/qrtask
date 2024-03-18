import 'dart:convert';


 import '../../../../../../helpers/Cache/cache_helper.dart';
import '../../models/res-models/user_model.dart';
import 'i_local_auth.dart';

class LocalAuth implements ILocalAuth<UserAuthModel> {
  final String key = "user";

  Future<UserAuthModel?> getUser() async {
    String? jsn = await CacheHelper.getValue(key: key);
print(jsn);
return jsn == null ? null : UserAuthModel.fromJson(jsonDecode(jsn));
  }

  @override
  Future<bool?> setUser(UserAuthModel? user) async {
    if (user != null) {
      return CacheHelper.saveData(key: key, value: user.toJson()).whenComplete(() {print('user:: ${user.email}');});
    } else {
      return CacheHelper.removeData(key: key);
    }
  }


  @override
  Future<bool> isAuthenticated() {
    return Future.value(CacheHelper.instance?.containsKey(key));
  }
}

///SecureLocalAuth

// class SecureLocalAuth implements ISecureLocalAuth<LoginWithPassReqModel> {
//   FlutterSecureStorage secureStorage;
//   SecureLocalAuth(this.secureStorage);
//   String key = "SecureLocalAuth";
//   @override
//   Future<LoginWithPassReqModel?> getAuthUserData() async {
//     String? json = await secureStorage.read(key: key);
//
//     if (json != null) {
//       return LoginWithPassReqModel.fromJson(json);
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future<bool> isContainsAuthUserData() async {
//     return await secureStorage.containsKey(key: key);
//   }
//
//   @override
//   Future<void> saveAuthUserData(LoginWithPassReqModel? user) async {
//     if (user == null) {
//       return await secureStorage.delete(key: key);
//     } else {
//       return await secureStorage.write(
//         key: key,
//         value: json.encode(user.toJson()),
//       );
//     }
//   }
//   }
