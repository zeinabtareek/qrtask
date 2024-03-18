
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qrtask/features/Authentication/presentation/verfictaion-screen/add_phone_screen.dart';
import '../../../../../core/enums/otp_enum.dart';
import '../../../../../core/utils/dialog/success_dialog.dart';
import '../../../../../helpers/Cache/cache_helper.dart';
import '../../../../../helpers/auth_helper/auth_check_state.dart';
import '../../../../../injection_container.dart';
import '../../../../../routes/paths.dart';
import '../../../data/local/auth_local_data_source.dart';
import '../../../data/models/base_model.dart';
import '../../../data/models/base_phone_req_model.dart';
import '../../../data/models/req-model/verify_phone_req_model.dart';
import '../../../domain/use-cases/auth_cases.dart';

part 'verfictaion_screen_state.dart';

class VerificationScreenCubit extends Cubit<VerificationScreenState> {
  VerificationScreenCubit() : super(VerificationScreenInitial()) {
    initVerificationScreen();
  }

  final AuthCases authCases = locator<AuthCases>();

  @override
  Future<void> close() {
    disposeVerificationScreen();
    return super.close();
  }

  /// [AddPhoneScreen]
  CountryCode loginSelectCountry = CountryCode.fromDialCode("+20");
  GlobalKey<FormState> loginWithPassKey =
      GlobalKey<FormState>(debugLabel: "loginWithPassKey");
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>(debugLabel: "formKey1");
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: "formKey");

  TextEditingController loginPhoneController = TextEditingController();

  sendOtp(BuildContext context) async {
     changeLoading(true);

    final req = VerifyPhoneReqModel(
      phoneReqModel: BasePhoneReqModel(
        phoneCode: loginSelectCountry.dialCode!,
        phone: loginPhoneController.text,
      ),
      phoneConfirmationToken: '',
    );

    try {
      final res = await authCases.verifyPhone(req, () {
        updateVerificationCode = req.phoneConfirmationToken;
        _toVerificationScreen(
          context,
          loginPhoneController.text,
          loginSelectCountry.dialCode!,
          OtpState.loginWithOtp,
        );
        emit(const VerificationScreenSuccess());
      }).whenComplete(() {});

      changeLoading(false);

      checkStatus<BaseResModel>(
        res,
        onSuccess: (res) {},
        onError: (res) {
          _isVisibleBtn = true;
        },
        showErrorToast: true,
        showSuccessToast: true,
      );
    } catch (e) {
      changeLoading(false);
    }
    // }
  }

  _toVerificationScreen(
      BuildContext context, String phone, String poneCode, OtpState state) {
    Map<String, dynamic> args = {};
    args["nums"] = phone;
    args["countryCode"] = poneCode;
    args["otpState"] = state;
    Navigator.of(context).popAndPushNamed(
      AppPaths.verificationScreen,
      arguments: args,
    );
    return null;
  }

  /// [VerificationScreen]

  String updateVerificationCode = '';

  bool get isVerificationIsLoading =>
      state is VerificationScreenLoadState &&
      (state as VerificationScreenLoadState).loadState == true;
  bool _isVisibleBtn = false;

  bool get isVisibleBtn => _isVisibleBtn;

  changeLoading(bool state) {
    emit(VerificationScreenLoadState(loadState: state));
  }

  changeTime(String min, String second) {
    emit(VerificationScreenTimerState(min: min, second: second));
  }

  changeViewStateBtn(String text) {
    print(text);

    if (text.length == 6) {
      otpCodeController.text = text;
      emit(
        VerificationScreenSendBtnViewState(viewState: _isVisibleBtn),
      );
    } else {
      if (!isVisibleBtn) {
        return;
      } else {
        _isVisibleBtn = false;
        emit(
          VerificationScreenSendBtnViewState(viewState: _isVisibleBtn),
        );
      }
    }
  }

  completeVerify(BuildContext context) async {
    changeLoading(true);
    var credintial = PhoneAuthProvider.credential(
      verificationId: updateVerificationCode,
      smsCode: otpCodeController.text,
    );
    try {
      final res = await authCases.verificationCompleted(credintial,(){

        _toHome(context);
      });

      changeLoading(false);
      checkStatus<BaseResModel>(
        res,
        onSuccess: (res) async {
           await locator<AuthLocalDataSource>()
              .updateField('phone', loginPhoneController.text)
              .whenComplete(() => _toHome(context));
          emit(const VerificationScreenSuccess());

        },
        onError: (res) {
          _isVisibleBtn = true;
          print('Error');
        },
        showErrorToast: true,
        showSuccessToast: true,
      );
    } catch (e) {
      print('Error2');
      _isVisibleBtn = true;
      changeLoading(false);
    }
    emit(VerificationScreenResendBtnState(reSendBtnState: _isVisibleBtn));

  }

  String min = '00';
  String second = '00';
  bool _isCounting = false;

  bool get isCounting => _isCounting;

  Timer? countdownTimer;
  Duration waitingDuration = const Duration(seconds: 59);
  TextEditingController otpCodeController = TextEditingController();

  void disposeVerificationScreen() {

    countdownTimer?.cancel();
    waitingDuration = const Duration(seconds: 59);
    _isCounting = false;
    changeLoading(false);
    otpCodeController.dispose();

    emit(VerificationScreenResendBtnState(reSendBtnState: _isCounting));
  }

  showSuccessDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SuccessDialog(
        rightBtnText: 'Go to Home',
        title: 'Register Successfully',
        onYesPressed: () {
          _toHome(context);
          // Navigator.pop(context);
        },
        des:
            'Congratulation! your account already crated.  Please login to get amazing experience.',
      ),
    );
  }

  void initVerificationScreen() {
    otpCodeController = TextEditingController();
    countdownTimer?.cancel();
    waitingDuration = const Duration(seconds: 59);
    startTimer();
    _isVisibleBtn = false;
    changeLoading(false);
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    _isCounting = true;
    emit(VerificationScreenResendBtnState(reSendBtnState: _isCounting));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = waitingDuration.inSeconds - reduceSecondsBy;
    _isCounting = true;
    if (seconds < 0) {
      countdownTimer!.cancel();
      _isCounting = false;

      changeTime(min, second);
      emit(VerificationScreenResendBtnState(reSendBtnState: _isCounting));
    } else {
      waitingDuration = Duration(seconds: seconds);
      _isCounting = true;
    }
    min = waitingDuration.inMinutes.toString().padLeft(2, '0');
    second = waitingDuration.inSeconds.toString().padLeft(2, '0');
    emit(VerificationScreenResendBtnState(reSendBtnState: _isCounting));
    changeTime(min, second);
  }


  void _savePhoneToLocal(BasePhoneReqModel phoneData) {
    CacheHelper.saveData(key: "phone", value: phoneData.toL());
  }

  static String authKey = "authKey";

  static bool get isAuthed => CacheHelper.getValue(key: authKey) ?? false;

  void _toHome(context) {
    CacheHelper.saveData(key: authKey, value: true).whenComplete(
      () {
        print(isAuthed);
        disposeVerificationScreen();
        Navigator.of(context).popAndPushNamed(
          AppPaths.homeScreen,
        );

      },
    );
  }
}
