import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../widgets/custom_button.dart';
import '../../../../common/app_style.dart';
import '../../../../core/bases/app_base.dart';
import '../../../../core/enums/otp_enum.dart';
import 'cubit/verfictaion_screen_cubit.dart';
import 'cubit/verfictaion_screen_cubit.dart';

class VerificationScreen extends AppBase<VerificationScreenCubit> {
  final String number;
  final String? countryCode;
  final OtpState otpState;

  VerificationScreen({
    super.key,
    required this.number,
    required this.otpState,
    this.countryCode,
  }) {
    cubit.initVerificationScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Text('verify code', style: K.boldBlackTextStyle(context)),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 20),
                  Text(
                    // 'verify your number +20$number',
                    'We have sent the code verification to \n your number +20 $number ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 11),
                  Form(
                      key: cubit.formKey1,
                      child: SizedBox(
                        width: 300,
                        child: PinCodeTextField(
                          length: 6,
                          appContext: context,
                          autoDismissKeyboard: true,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.slide,
                          controller: cubit.otpCodeController,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 40,
                            fieldWidth: 40,
                            borderWidth: .2,
                            borderRadius: BorderRadius.circular(5),
                            selectedFillColor: Theme.of(context).hintColor,
                            inactiveFillColor: Theme.of(context).cardColor,
                            activeColor: Theme.of(context).hintColor,
                            activeFillColor: Theme.of(context).cardColor,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,

                          enableActiveFill: true,
                          validator: (value) =>
                              (value != null && value.length < 6)
                                  ? 'LocaleKeys.otpReq.tre'
                                  : null,
                          onChanged: (_) => cubit.changeViewStateBtn(_),
                          onCompleted: (_) => cubit.completeVerify(context),
                          beforeTextPaste: (text) => true,
                          textStyle: const TextStyle(),
                          pastedTextStyle: const TextStyle(),
                        ),
                      )),
                  SizedBox(height: MediaQuery.sizeOf(context).height / 12),

                  BlocBuilder<VerificationScreenCubit, VerificationScreenState>(
                      bloc: cubit,
                      builder: (context, state) {
                        return Visibility(
                          // visible: cubit.isVisibleBtn  ,
                          visible: cubit.isVisibleBtn || !cubit.isCounting,
                          child: CustomButton(
                            showBorder: true,
                            borderWidth: 1,
                            transparent: false,
                            backgroundColor: Theme.of(context).disabledColor,
                            borderColor: Colors.transparent,
                            // textColor: Theme.of(context).disabledColor,

                            fontSize: 16,
                            isLoading:
                                state is VerificationScreenResendBtnLoading,
                            buttonText: "resend_otp",
                            onPressed: () => cubit.sendOtp(context),
                            radius: 5,
                          ),
                        );
                      }),
                  SizedBox(height: 30.h),
                  BlocBuilder<VerificationScreenCubit, VerificationScreenState>(
                    bloc: cubit,
                    builder: (context, state) {
                      return Visibility(
                        visible: cubit.isCounting,
                        child: Center(
                          child: Text("${cubit.min}:${cubit.second}",
                              style: K.blackTextStyleLarge(context)),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                ],
              ),
            ),

      ),
    );
  }
}
