
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/app_style.dart';
import '../../../../core/bases/app_base.dart';
import '../../../../core/utils/validator.dart';
import '../../../../widgets/custom_button.dart';
 import '../../../../widgets/custom_text_field.dart';
import 'cubit/sign_up_cubit.dart';


class SignUpScreen extends AppBase<SignUpCubit> {
  SignUpScreen({Key? key})
      : super(   key: key,  ) {

    cubit.initSignUp();
  }

  @override
  Widget build(BuildContext context) {
    return

    Scaffold(
    body: Center(
    child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child:Form(
            key: cubit.signUpKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Text(
                    'Create an Account ',
                    style: K.boldBlackTextStyle(context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  CustomTextField(
                    isLtr: true,
                    validator: (p0) => TValidator.normalValidator(
                      p0,
                      hint: 'name',
                    ),
                    hintText: 'name',   prefix: false,
                    inputType: TextInputType.text,
                    prefixHeight: 70,
                    fillColor: Colors.transparent,
                    inputAction: TextInputAction.done,
                    controller: cubit.reqFNameController,
                    focusNode: null,
                  ),
                  SizedBox(height: 20.h),


                  CustomTextField(
                    hintText:  'email',
                    isLtr: true,
                    isEnabled: true,   prefix: false,
                    validator: (p0) => TValidator.email(
                     value: p0,
                     hint: 'email',
                    ),
                    inputType: TextInputType.emailAddress,
                     controller: cubit.regEmilController,
                    prefixHeight: 70,
                    fillColor: Colors.transparent,
                    inputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 20.h),
                  CustomTextField(   prefix: false,
                    isLtr: true,
                    validator: (p0) => TValidator.passwordValidate(
                      value: p0,
                      hint:'password',
                    ),
                    hintText: 'password',
                    inputType: TextInputType.text,
                    prefixHeight: 70,
                    inputAction: TextInputAction.done,
                    isPassword: true,
                    fillColor: Colors.transparent,
                    controller: cubit.regPassController,
                    // onFieldSubmitted: (text) => cubit.loginWithPass(),
                    focusNode: null,
                  ),

                  SizedBox(height: 20.h),
                  CustomTextField(
                    isLtr: true,
                    hintText: 'confirm password',   prefix: false,
                    inputType: TextInputType.text,
                     prefixHeight: 70,
                    inputAction: TextInputAction.next,
                    isPassword: true,
                    fillColor: Colors.transparent,
                    controller: cubit.regNewPassController,
                    validator: (value) => TValidator.confirmPasswordValidate(
                      value: value,
                      comparePassword: cubit.regPassController.text,
                      hint:'confirm password',
                    ),
                  ),

                  SizedBox(height: 20.h),
                  // CustomTextField(
                  //   isLtr: true,
                  //   hintText: 'phone',
                  //   prefix: true,
                  //   inputType: TextInputType.number,
                  //
                  //   prefixHeight: 70,
                  //   inputAction: TextInputAction.done,
                  //   isPassword: false,
                  //   fillColor: Colors.transparent,
                  //   controller: cubit.regPhoneController,
                  //   onFieldSubmitted: (v)=> cubit.signUp(context),
                  //
                  // ),
                  // const Text('enter your phone without (0)'),
                  // K.sizedBoxH1,
                  // CustomTextField(
                  //   hintText:  'Phone Number',
                  //   isLtr: true,
                  //   isEnabled: true,
                  //   prefix: true,
                  //
                  //   fillColor: Colors.transparent,
                  //   validator: (p0) => TValidator.egyNumber(
                  //     value: p0,
                  //     hint: '',
                  //   ),
                  //   inputType: TextInputType.number,
                  //
                  //   countryDialCode: cubit.regSelectCountry.dialCode,
                  //   controller: cubit.regPhoneController,
                  //   inputAction: TextInputAction.next,
                  //   // onCountryChanged: (_) => cubit.loginSelectCountry,
                  //   onFieldSubmitted: (v)=> cubit.signUp(context),
                  //
                  // ),


                    SizedBox(height: 20.h),
                  BlocConsumer<SignUpCubit, RegisterState>(
                    listener: (context, state) {
                    },
                    bloc: cubit,
                    builder: (context, state) {
                      return CustomButton(
                        showBorder: true,
                        borderWidth: 1,
                        transparent: false,
                        // width: 250.w,
                        fontSize: 16,
                        // isLoading:false,
                        isLoading: state is Loading  ,
                        buttonText: 'sign up',
                        onPressed: () {

                          // cubit.toVerificationScreen(context);
                          cubit.signUp(context);
                        },
                        radius: 5 ,
                      );
                    },
                  ),
                  // ),

                  K.sizedBoxH1,
                  K.sizedBoxH1,
                  Text('You have an account?', ),
                  TextButton(
                    child: const Text('Login',   ),
                    onPressed: () => cubit.toSignInScreen(context),
                  ),
                  K.sizedBoxH1,

                  // Text(
                  //   'AR',
                  //   style: K.blackBoldTextStyle(context),
                  // ),
                 // SizedBox(height: 40.h,)
                ],
              ),
            ),
          ),
          ),




    );
  }
}
