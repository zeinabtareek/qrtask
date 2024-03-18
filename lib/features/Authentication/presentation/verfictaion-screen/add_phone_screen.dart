

//AddPhoneScreen


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_style.dart';
import '../../../../core/bases/app_base.dart';
import '../../../../core/utils/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../login/controller/login_with_pass_CUBIT.dart';
import '../login/controller/login_with_pass_state.dart';
import 'cubit/verfictaion_screen_cubit.dart';

class AddPhoneScreen extends AppBase<VerificationScreenCubit> {
  AddPhoneScreen({Key? key})
      : super(
    key: key,
  ) {
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
            child: Form(
              key: cubit.formKey,
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



                    Text('Two -Factor Authentication',style: K.boldBlackTextStyle(context),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Text('Enter You Phone number without (0) you will receive a verification code as an sms',style: K.blackTextStyleLarge(context),textAlign: TextAlign.center,),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    CustomTextField(
                      hintText:  'Phone Number',
                      isLtr: true,
                      isEnabled: true,
                      prefix: true,

                      fillColor: Colors.transparent,
                      validator: (p0) => TValidator.egyNumber(
                        value: p0,
                        hint: 'phone number',
                      ),
                      inputType: TextInputType.number,

                      countryDialCode: cubit.loginSelectCountry.dialCode,
                      controller: cubit.loginPhoneController,
                      inputAction: TextInputAction.next,
                      onCountryChanged: (_) => cubit.loginSelectCountry,
                    ),


                    K.sizedBoxH1,
                    BlocConsumer<VerificationScreenCubit, VerificationScreenState>(


                      bloc: cubit,
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Center(
                          child: CustomButton(
                            isLoading: state is VerificationScreenLoadState ? true : false,
                            buttonText: 'Send OTP',
                            fontSize: 16,

                            onPressed: () => cubit.sendOtp( context),
                            radius: 5,
                          ),
                        );
                      },
                    ),

                    K.sizedBoxH1,
                    K.sizedBoxH1,

                    // TextButton(
                    //   child: Text('Send OTP', style: K.primarySmallTextStyle(context),
                    //   ),
                    //   onPressed: () => cubit.sendOtp(context),
                    // ),

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
