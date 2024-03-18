
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrtask/core/bases/base_cubit.dart';
import 'package:qrtask/injection_container.dart';
import 'package:qrtask/widgets/custom_button.dart';
import '../../../../common/app_style.dart';
import '../../../../core/bases/base_state/base_cubit_state.dart';
import '../../../../core/bases/base_view.dart';
import '../../../../core/utils/dialog/error_dialog.dart';
import '../../domain/use_case/qr_repo_use_case.dart';
import '../../widget/default_mode.dart';
import '../../widget/dynamic_mode.dart';
import '../cubit/home_screen_cubit.dart';

class QRScannerWidget extends StatelessWidget {
  Barcode? result;
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return


      BaseView<HomeScreenCubit>(
      vmBuilder: (context) => HomeScreenCubit(locator<QrUseCase>()),
      listener: (context, state) => debugPrint(state.runtimeType.toString()),
      builder: (context, state) => _buildSuccessView(context, state as BaseCompletedState,context.read<HomeScreenCubit>()),
      errorBuilder: (context, state) => ErrorDialog(
        title: 'Error',
        message: state.errorMessage.toString() ?? '',
        resetState: () async {},
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context, BaseCompletedState state ,HomeScreenCubit cubit) =>
      qrScannerBody(
        qrKey: qrKey,
        onQRViewCreated: (controller) {
          HomeScreenCubit cubit = context.read<HomeScreenCubit>();
          cubit.onQRViewCreated(context, controller);
        },
        cubit:cubit
      );
}

Widget qrScannerBody({
  required void Function(QRViewController) onQRViewCreated,
  required  HomeScreenCubit cubit,
  required qrKey,
}) {
  return Padding(
    padding: K.fixedPadding1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text(
           'Scan Or Generate Qr Code',
           style: K.boldBlackTextStyle(OneContext().context!),
         ),
         Image.network(     'https://static.vecteezy.com/system/resources/previews/022/610/089/original/3d-scanning-a-qr-code-on-your-phone-phone-in-hand-scans-qr-code-png.png'),


            Text(
              'NOTE :::Scan pre-generated QR codes provided by merchants.',
              style: TextStyle(color: Colors.grey,fontSize: 12.sp),
            ),K.sizedBoxH1,
            CustomButton(
              radius: 5.r,
              width: 200.w,
              borderColor: Colors.black,
              backgroundColor: K.lightPrimaryColor,
              showBorder: true,
              borderWidth: 1.w,
              textColor: K.gradientLightGreenColor,
              buttonText: 'Static Scanning',
              onPressed: () {
                // Navigate to Static Scanning Mode
                OneContext().push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return   DefaultMode(startScan: ()=>cubit.startScan(), code: cubit.code,);
                  },
                ));
              },
            ),
              K.sizedBoxH1,

            Text(
              'NOTE ::: Scan QR codes with changing information generated on-the-fly.',
              style: TextStyle(color: Colors.grey,fontSize: 12.sp,)
            ),
              K.sizedBoxH1,


            CustomButton(
              radius: 5.r,
              width: 200.w,
              borderColor: Colors.black,
              backgroundColor: K.gradientLightGreenColor,
              showBorder: true,
              borderWidth: 1.w,
              buttonText: 'Dynamic Scanning',
              onPressed: () {
                // Navigate to Dynamic Scanning Mode
                OneContext().push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DynamicMode();
                  },
                ));
              },
            ),


      ],
    ),
  );
}
