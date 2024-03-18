import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../helpers/auth_helper/auth_check_state.dart';
import '../../../../../injection_container.dart';
import '../../../../../routes/paths.dart';
import '../../../data/local/auth_local_data_source.dart';
import '../../../data/models/res-models/user_model.dart';
import '../../../data/models/sign_up_model.dart';
import '../../../domain/use-cases/auth_cases.dart';
import 'login_with_pass_state.dart';

class LoginWithPassCubit extends Cubit<LoginWithPassState> {
  LoginWithPassCubit(this.authCases) : super(LoginWithPassInitial()) {
    initLoginWithPassScreen();
  }

  @override
  Future<void> close() {
    disposeLogin();
    return super.close();
  }

  final AuthCases authCases;


  ///  [SignInScreen]

  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
   GlobalKey<FormState> loginWithPassKey =
      GlobalKey<FormState>(debugLabel: "loginWithPassKey");

  void initLoginWithPassScreen() async {
    loginPhoneController = TextEditingController();
    loginPassController = TextEditingController();
  }

  bool isLoginWithPassLoading = false;

  ///LOGIN ###############
  void loginWithPass(BuildContext context) async {
    try {
      if (_validate()) {
        emit(LoginWithPassLoading());
        await Future.delayed(const Duration(seconds: 1));
        var req = QrSignUpReqModel(
            password: loginPassController.text,
            email: loginPhoneController.text  );
        final res = await authCases.loginWithPassword(req);

        print(' LOGIN ERROR MSG ${res.errorMsg}');

        checkStatus(res,
          onError: (error) {
          print(' LOGIN ON ERROR MSG ${res.errorMsg}');

          emit(LoginWithPassError(res.errorMsg?? ""));
        },

          onSuccess: (res) async {
          print(' LOGIN  SUCCESS   ${res?.data?.user?.uid}');
          emit(const LoginWithPassSuccess());

          final User userFirebase = res!.user!;
          final user = UserAuthModel.fromFirebaseUser(userFirebase);
          await locator<AuthLocalDataSource>().setUserModel(user);
          locator<BaseAuthLocalDataSource>()
              .setUserLoggedIn(user.token.toString());
          var x = locator<AuthLocalDataSource>().getUserModel();
            print('User Data ${x?.email}');
          toAddPhoneScreen(context);
        },
            showErrorToast: true,
            showSuccessToast: true,

        );
      }
    } catch (e) {

      print('Error ###${e.toString()}');
      emit(LoginWithPassError(e.toString() ?? ""));

    }
  }



  bool _validate() => loginWithPassKey.currentState!.validate();



  void disposeLogin() {
    for (var element in [loginPhoneController, loginPassController]) {
      element.dispose();
    }
  }

  toAddPhoneScreen(BuildContext context) {
        Navigator.of(context).popAndPushNamed(
          AppPaths.addPhoneScreen,

    );
  }
  toSignUpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppPaths.signUp);
  }
}
