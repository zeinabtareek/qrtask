import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_context/one_context.dart';
import 'package:qrtask/features/Authentication/data/models/req-model/login_with_otp_model.dart';
import 'package:qrtask/features/Authentication/data/models/req-model/verify_phone_req_model.dart';

import '../../../../../helpers/Cache/cache_helper.dart';
import '../../../../../helpers/auth_helper/data_state.dart';
import '../../../../../routes/paths.dart';
import '../../models/res-models/register_res_model.dart';
import '../../models/sign_up_model.dart';

abstract class RemoteDataSource {
  Future<DataState<QrTaskAuthorizedResModel>> signInWitEmailandPassword(
      {required QrSignUpReqModel reqModel});

  Future<DataState<QrTaskAuthorizedResModel>> signUpWithEmailAndPassword(
      {required QrSignUpReqModel reqModel});

  Future checkOtpCode(LoginWithOtpReqModel req);

  Future logout();

  verifyPhone(VerifyPhoneReqModel verifyPhoneReqModel, Function onCodeSent) {}

  verificationCompleted(PhoneAuthCredential credential,Function onComplete);
}

class RemoteDatasourceImpl implements RemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RemoteDatasourceImpl(instance);

  @override
  Future<DataState<QrTaskAuthorizedResModel>> signInWitEmailandPassword(
      {required QrSignUpReqModel reqModel}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: reqModel.email!,
        password: reqModel.password!,
      );
      return DataSuccess(QrTaskAuthorizedResModel(result.user));
    } catch (e) {
      return DataFailedErrorMsg(e.toString(), null);
    }
  }

  @override
  Future<DataState<QrTaskAuthorizedResModel>> signUpWithEmailAndPassword(
      {required QrSignUpReqModel reqModel}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: reqModel.email!,
        password: reqModel.password!,
      );
      print(result);
      return DataSuccess(QrTaskAuthorizedResModel(result.user));
    } catch (e) {
      // throw e;
      return DataFailedErrorMsg(e.toString(), null);
    }
  }

  @override
  Future checkOtpCode(LoginWithOtpReqModel req) {
    throw UnimplementedError();
  }

  @override
  Future logout() {
    throw UnimplementedError();
  }

  @override
  verifyPhone(
    VerifyPhoneReqModel verifyPhoneReqModel,
    Function onCodeSent,
  ) async {
    try {
      final result = await _auth.verifyPhoneNumber(
        phoneNumber: verifyPhoneReqModel.phoneReqModel.phoneCode +
            verifyPhoneReqModel.phoneReqModel.phone,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          // await verificationCompleted(phoneAuthCredential);
          ///Zeinab back here
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          verifyPhoneReqModel.phoneConfirmationToken = verificationId;
          onCodeSent();
          print('Code sent: $verificationId');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verifyPhoneReqModel.phoneConfirmationToken = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );

      return DataSuccess(result);
    } catch (e) {
      return DataFailedErrorMsg(e.toString(), null);
    }
  }

  @override
  verificationCompleted(PhoneAuthCredential phoneAuthCredential,
      Function onComplete,) async {
    try {
      var user = await _auth.signInWithCredential(phoneAuthCredential).then(
        (value) async {
          if (value.user != null) {

            print('value.user ${value.user}');
            onComplete();
          }
        },
      );
      return user;
    } catch (e) {
      throw e;
    }
  }

  static String authKey = "authKey";

  static bool get isAuthed => CacheHelper.getValue(key: authKey) ?? false;

  // void _toHome() {
  //   CacheHelper.saveData(key: authKey, value: true).whenComplete(
  //     () {
  //       print(isAuthed);
  //       OneContext().pushReplacementNamed(
  //         AppPaths.homeScreen,
  //       );
  //     },
  //   );
  // }
}
