import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easy_permission/flutter_easy_permission.dart';


import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:qrtask/core/bases/base_state/base_cubit_state.dart';

import '../../../common/app_style.dart';
import '../../../common/data.dart';
import '../../../core/bases/base_view.dart';
import '../../../core/utils/dialog/error_dialog.dart';
import '../../../injection_container.dart';
import '../../../widgets/custom_button.dart';
import '../domain/use_case/qr_repo_use_case.dart';
import '../presentation/cubit/home_screen_cubit.dart';


class DefaultMode extends StatelessWidget {
  final void Function() startScan;
  final String code;

  const DefaultMode({Key? key, required this.startScan, required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      BaseView<HomeScreenCubit>(
        vmBuilder: (context) => HomeScreenCubit(locator<QrUseCase>()),
        listener: (context, state) => debugPrint(state.runtimeType.toString()),
        builder: (context, state) => _buildSuccessView(context, state as BaseCompletedState),
        errorBuilder: (context, state) => ErrorDialog(
          title: 'Error',
          message: state.errorMessage.toString() ?? '',
          resetState: () async {},
        ),
      );
  }

  Widget _buildSuccessView(BuildContext context, BaseCompletedState state) =>
      screenSuccessBody(state ,context.read<HomeScreenCubit>());


}

Widget screenSuccessBody(BaseCompletedState state, HomeScreenCubit cubit,
{  startScan}){
  return Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Display scanned code
              const SizedBox(height: 300,),


              Expanded(
                child: Text(
                  'Scan Default Mode',
                  style: K.boldBlackTextStyle(OneContext().context!),
                ),
              ),
              Container(
                margin: K.fixedPadding1,
                padding: K.fixedPadding1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),

                child: Text(
                  cubit.code,
                  // "Scanned Code Placeholder", // Replace with actual code
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                height: 16,
              ),   CustomButton(
                radius: 5.r,
                width: 200.w,
                borderColor: Colors.black,
                backgroundColor: K.lightPrimaryColor,
                showBorder: true,
                borderWidth: 1.w,
                textColor: K.gradientLightGreenColor,
                buttonText: 'Press To Scan',
                onPressed: cubit.startScan,
              ),
              SizedBox(height: 300,),


            ],
          ),
        ),
      );
}