

import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one_context/one_context.dart';
import '../../../../../core/enums/otp_enum.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../helpers/Cache/cache_helper.dart';
import '../../../../../helpers/auth_helper/auth_check_state.dart';
import '../../../../../injection_container.dart';
import '../../../../../routes/paths.dart';
import '../../../data/local/auth_local_data_source.dart';
import '../../../data/models/res-models/user_model.dart';
import '../../../data/models/sign_up_model.dart';
import '../../../domain/use-cases/auth_cases.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';



class SignUpCubit extends Cubit<RegisterState> {

  SignUpCubit(this.authCases,
       )
      : super(const RegisterState.initial());

      AuthCases authCases;
  /// Register  textEditing Controllers
   TextEditingController reqFNameController = TextEditingController();
  TextEditingController reqLNameController = TextEditingController();
  TextEditingController regEmilController = TextEditingController();
  TextEditingController regPassController = TextEditingController();
  TextEditingController regNewPassController = TextEditingController();
  // TextEditingController regPhoneController = TextEditingController();


  /// Register focusNodes


  FocusNode regFirstNameFocusNode = FocusNode();
  FocusNode regLastNameFocusNode = FocusNode();
  FocusNode regEmilFocusNode = FocusNode();
  FocusNode regPasswordFocusNode = FocusNode();
  FocusNode regNewPassFocusNode = FocusNode();
  FocusNode regPhoneFocusNode = FocusNode();


  CountryCode regSelectCountry = CountryCode.fromDialCode("+20");
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  initSignUp() {
    reqFNameController = TextEditingController();
    regFirstNameFocusNode = FocusNode();
    reqLNameController = TextEditingController();
    regLastNameFocusNode = FocusNode();

    // regPhoneController = TextEditingController();
    regPhoneFocusNode = FocusNode();

    regEmilController = TextEditingController();
    regEmilFocusNode = FocusNode();

    regPassController = TextEditingController();
    regPasswordFocusNode = FocusNode();

    regNewPassController = TextEditingController();
    regNewPassFocusNode = FocusNode();
    authCases = locator<AuthCases>();
  }

  void disposeSignUp() {
    for (var element in [
      reqFNameController,
      reqLNameController,
      regFirstNameFocusNode,
      regLastNameFocusNode,
      // regPhoneController,
      regPhoneFocusNode,
      regEmilController,
      regEmilFocusNode,
      regPassController,
      regPasswordFocusNode,
      regNewPassController,
      regNewPassFocusNode,
    ]) {
      element.dispose();
    }
  }







  bool isLoadingSignUp = false;



  // //
  //  toVerificationScreen(BuildContext context) {
  //   assert(true, "This is an assertion message");
  //   print('This is an assertion message');
  //
  //   // Map<String, dynamic> arguments = {};
  //   // arguments= {
  //   //   "nums": regPhoneController.text,
  //   //    "otpState": OtpState.register
  //   //
  //   // };
  //   Navigator.of(context).pushNamed(
  //     AppPaths.verificationScreen,
  //     // arguments: arguments,
  //   );
  // }

   bool _validate() {

    return signUpKey.currentState!.validate();
  }

  static String authKey = "authKey";
  toSignInScreen(context){
    Navigator.pop(context);
  }
  static bool get isAuthed => CacheHelper.getValue(key: authKey) ?? false;




  signUp(context)async{//toVerificationScreen
    try {
    if (_validate()) {
      emit(const RegisterState.loading());
      await Future.delayed(const Duration(seconds: 1));

      final  reqModel = QrSignUpReqModel(
         email: regEmilController.text,
        fName:reqFNameController.text,
        // phone: regPhoneController.text,
        password:  regPassController.text,
        deviceToken: ' ',
        deviceType: ' ',
        referralCode: ' ',

      );
    final res = await authCases.registerUser(reqModel);
    print(res);
      checkStatus(
        res,
        onSuccess: (res) async {
          print('Success ###,${res!.user!.uid}');
          final User userFirebase = res.user!;
          final user = UserAuthModel.fromFirebaseUser(userFirebase);
          await   authCases.setUserDate(user);
          await   locator<BaseAuthLocalDataSource>().setUserModel(user).whenComplete(() async =>
          await _toAddPhoneScreen(  context));
          // await sendOtp2(  context));
              locator<BaseAuthLocalDataSource>().getUserModel();




          emit(const RegisterState.success());
        },
        onError: (E) {
          print('Error ###,${E?.msg.toString()}');
          showVipToast(context,message: E!.msg.toString(),isError: true);

          emit(RegisterState.error(E.data?.msg ?? ""));
        },
        showErrorToast: true,
      );
    }
    }
    catch (e) {
      emit(RegisterState.error(e.toString() ?? ""));

    }





  }
bool otpLoading=false;
 _toAddPhoneScreen(
      BuildContext context,    )
  {

    Navigator.of(context).popAndPushNamed(
      AppPaths.addPhoneScreen,

    );
    return null;



}
}