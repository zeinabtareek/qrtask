import 'package:firebase_auth/firebase_auth.dart';
import 'package:qrtask/features/Authentication/data/repo-imp/auth_repo_imp.dart';

import '../../../../../helpers/auth_helper/typedefs.dart';
import '../../data/models/base_phone_req_model.dart';
import '../../data/models/sign_up_model.dart';
import '../../data/models/req-model/login_with_otp_model.dart';
import '../../data/models/req-model/verify_phone_req_model.dart';
import '../../data/models/res-models/user_model.dart';


class AuthCases {
  final AuthRepoImp _data;

  AuthCases(this._data);

  FDH registerUser(
    QrSignUpReqModel vipSignUpReqModel,
  ) {
    return _data.register(vipSignUpReqModel);
  }

  FDH loginWithPassword(
    QrSignUpReqModel vipSignUpReqModel,
  ) {
    return _data.signIn(vipSignUpReqModel);
  }

  Future<UserAuthModel?> getUserData() {
    return _data.getUserData();
  }

  Future<bool> isAuthenticated() {
    return _data.isAuthenticated();
  }

  FDM sendOtp(
    BasePhoneReqModel sendOtpReqModel,
  ) {
    return _data.sendOtp(sendOtpReqModel);
  }

  Future<bool?> setUserDate(UserAuthModel? user) {
    return _data.setUserDate(user);
  }

  verifyPhone(
      VerifyPhoneReqModel verifyPhoneReqModel,
      Function onCodeSent,
      ) {
     return _data.verifyPhone(verifyPhoneReqModel, onCodeSent);
  }
  verificationCompleted(PhoneAuthCredential credential,onComplete) {
     return _data.verificationCompleted( credential,onComplete);
  }

  FDM checkOtpCode(LoginWithOtpReqModel req) async {
    return _data.checkOtpCode(req);
  }

  logout() {
    return _data.logout();
  }
}
