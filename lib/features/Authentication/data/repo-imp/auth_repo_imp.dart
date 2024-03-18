import 'dart:io';

 import 'package:firebase_auth/firebase_auth.dart';
import 'package:qrtask/features/Authentication/data/models/base_phone_req_model.dart';
import '../../../../../helpers/auth_helper/data_state.dart';
 import '../../domain/repo/auth_repo.dart';
import '../models/base_model.dart';
import '../models/sign_up_model.dart';
import '../models/req-model/login_with_otp_model.dart';
import '../models/req-model/verify_phone_req_model.dart';
import '../models/res-models/register_res_model.dart';
import '../models/res-models/user_model.dart';
import '../services/local/local_auth.dart';
import '../services/remote/remote_auth.dart';

class AuthRepoImp implements AuthRepo {
  final RemoteDatasourceImpl remoteApiAuth;
  final LocalAuth localAuth;
  AuthRepoImp({
    required this.remoteApiAuth,
    required this.localAuth,
   });

  @override
  Future<DataState<QrTaskAuthorizedResModel>> register(
      QrSignUpReqModel signUpReqModel) async {
    try {
      var res = await remoteApiAuth.signUpWithEmailAndPassword(reqModel: signUpReqModel);

      if (res is DataSuccess<QrTaskAuthorizedResModel>) {
        return res;
      } else if (res is DataFailed<QrTaskAuthorizedResModel>) {
        return DataFailedErrorMsg(res.error?.message ?? "", res.data);
      } else if (res is DataFailedErrorMsg<QrTaskAuthorizedResModel>) {
    //
        return res;
      } else {
        return  DataFailedErrorMsg(res.errorMsg.toString(), null);
      }
    } catch (e) {
      return DataFailedErrorMsg(e.toString(), null);
    }
    }

    @override
  Future<DataState<QrTaskAuthorizedResModel>> signIn(
      QrSignUpReqModel signUpReqModel) async {
    try {
      var res = await remoteApiAuth.signInWitEmailandPassword(reqModel: signUpReqModel);
      if (res is DataSuccess<QrTaskAuthorizedResModel>) {
        return res;
      } else if (res is DataFailed<QrTaskAuthorizedResModel>) {
        return DataFailedErrorMsg(res.error?.message ?? "", res.data);
      } else if (res is DataFailedErrorMsg<QrTaskAuthorizedResModel>) {

        return res;
      } else {
        return   DataFailedErrorMsg(res.errorMsg.toString(), null);
      }
    } catch (e) {
      return DataFailedErrorMsg(e.toString(), null);
    }
    }





  @override
  Future<UserAuthModel?> getUserData() {
    return localAuth.getUser();
  }

  @override
  Future<bool> isAuthenticated() {
    return localAuth.isAuthenticated();
  }



  @override
  Future<bool?> setUserDate(UserAuthModel? user) {
    return localAuth.setUser(user);
  }



  @override
  Future<DataState<void>> verifyPhone(  VerifyPhoneReqModel verifyPhoneReqModel,    Function onCodeSent,) async {

      var res = await remoteApiAuth.verifyPhone(verifyPhoneReqModel,onCodeSent);

        return res;
  }  @override
  Future<DataState<void>> verificationCompleted( PhoneAuthCredential phoneAuthProvider,Function onComplete) async {

    // try {
      var res = await remoteApiAuth.verificationCompleted(phoneAuthProvider,onComplete);

       print('Verfy  OTP ${res}');

    //   if (res is DataSuccess<void>) {
    //     return const DataSuccess(null);
    //   } else if (res is DataFailed<void>) {
    //     return DataFailedErrorMsg(res.error?.message ?? "", res.data);
    //   } else if (res is DataFailedErrorMsg<void>) {
        return res;
    //   } else {
    //     return const DataFailedErrorMsg('Unknown response', null);
    //   }
    // } catch (e) {
    //    return DataFailedErrorMsg(e.toString(), null);
    // }
  }

  @override
  Future<DataState<MsgModel>> checkOtpCode(LoginWithOtpReqModel req) async {
    try {
      var res = await remoteApiAuth.checkOtpCode(req);

      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(res.data);
      } else {
        return DataFailedErrorMsg(res.data.msg ?? "", res.data);
      }
    } catch (e) {
      return DataFailedErrorMsg(e.toString(), null);
    }
  }

  @override
  Future logout() async {
    try {
      var res = await remoteApiAuth.logout();

      if (res.response.statusCode == HttpStatus.ok) {
        return DataSuccess(res.data);
      } else {
        return DataFailedErrorMsg(res.data.msg ?? "", res.data);
      }
    } catch (e) {
      return DataFailedErrorMsg(e.toString(), null);
    }
  }

  @override
  Future<DataState<MsgModel>> sendOtp(BasePhoneReqModel sendOtpReqModel) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }







}
