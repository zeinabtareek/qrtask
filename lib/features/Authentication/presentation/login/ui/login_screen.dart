import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import '../../../../../common/app_style.dart';
import '../../../../../core/bases/app_base.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../controller/login_with_pass_CUBIT.dart';
import '../controller/login_with_pass_state.dart';

class SignInScreen extends AppBase<LoginWithPassCubit> {
  SignInScreen({Key? key})
      : super(
          key: key,
        ) {
    cubit.initLoginWithPassScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: cubit.loginWithPassKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),

                  Text(
                    'Hello Welcome',
                    style: K.boldBlackTextStyle(context),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  CustomTextField(
                    hintText: 'john@gmail.com',
                    isLtr: true,
                    isEnabled: true,

                    prefix: false,
                    fillColor: Colors.transparent,
                    validator: (p0) => TValidator.email(
                      value: p0,
                      hint: 'email',
                    ),
                    inputType: TextInputType.emailAddress,
                    controller: cubit.loginPhoneController,
                    inputAction: TextInputAction.next,
                    // onCountryChanged: (_) => cubit.loginSelectCountry,
                  ),
                  K.sizedBoxH1,

                  CustomTextField(
                    isLtr: true,
                    validator: (p0) => TValidator.passwordValidate(
                      value: p0,
                      hint: 'password',
                    ),
                    hintText: 'Password',
                    prefix: false,
                    inputType: TextInputType.text,
                    prefixIcon: null,
                    prefixHeight: 70,
                    fillColor: Colors.transparent,
                    inputAction: TextInputAction.done,
                    controller: cubit.loginPassController,
                    onFieldSubmitted: (text) => cubit.loginWithPass(context),
                    focusNode: null,
                    isPassword: true,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            // await cubit.toForgetPassScreen(
                            //     context, cubit.loginPhoneController.text);
                          },
                          child: const Text('forget password?'),
                        ),
                      )
                    ],
                  ),
                  K.sizedBoxH1,
                  BlocConsumer<LoginWithPassCubit, LoginWithPassState>(
                    bloc: cubit,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Center(
                        child: CustomButton(
                          isLoading: state is LoginWithPassLoading,
                          buttonText: 'login',
                          fontSize: 16,
                          onPressed: () => cubit.loginWithPass(context),
                          radius: 5,
                        ),
                      );
                    },
                  ),

                  K.sizedBoxH1,
                  K.sizedBoxH1,
                  const Text(
                    'do not have an account?',
                  ),
                  TextButton(
                    child: const Text(
                      'sign up',
                    ),
                    onPressed: () => cubit.toSignUpScreen(context),
                  ),



                  K.sizedBoxH1,
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: SizedBox(),
                      value: selectedValue,
                      items: dropdownItems,
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String selectedValue = "ar";

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "ar",
        child: Text(
          "AR",
          style: K.blackTextStyleLarge(OneContext().context!),
        )),
    DropdownMenuItem(
        value: "en",
        child: Text(
          "EN",
          style: K.blackTextStyleLarge(OneContext().context!),
        )),
  ];
  return menuItems;
}
