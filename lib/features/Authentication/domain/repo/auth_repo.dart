import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../helpers/auth_helper/data_state.dart';
import '../../data/models/base_model.dart';
import '../../data/models/base_phone_req_model.dart';
import '../../data/models/sign_up_model.dart';
import '../../data/models/req-model/login_with_otp_model.dart';
import '../../data/models/req-model/verify_phone_req_model.dart';
import '../../data/models/res-models/register_res_model.dart';
import '../../data/models/res-models/user_model.dart';

abstract class AuthRepo {
  Future<DataState<QrTaskAuthorizedResModel>> register(
    QrSignUpReqModel completeDataReqModel,
  );

  Future<DataState<QrTaskAuthorizedResModel>> signIn(
    QrSignUpReqModel signINReqModel,
  );

  Future<DataState<void>> verifyPhone(
    VerifyPhoneReqModel verifyPhoneReqModel,
      Function onCodeSent,

      );

  Future<DataState<void>> verificationCompleted( PhoneAuthCredential phoneAuthCredential,Function onComplete );


  Future<DataState<MsgModel>> sendOtp(
    BasePhoneReqModel sendOtpReqModel,
  );

  Future<DataState<MsgModel>> checkOtpCode(LoginWithOtpReqModel req);

  Future<bool?> setUserDate(UserAuthModel? user);

  Future<UserAuthModel?> getUserData();

  Future<bool> isAuthenticated();

  Future logout();
}
