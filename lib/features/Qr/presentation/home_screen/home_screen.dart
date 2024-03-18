import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:qrtask/core/bases/base_state/base_cubit_state.dart';
import 'package:qrtask/features/Qr/presentation/cubit/home_screen_cubit.dart';
import '../../../../common/app_style.dart';
import '../../../../core/bases/base_view.dart';
import '../../../../core/utils/dialog/error_dialog.dart';
import '../../../../injection_container.dart';
import '../../../../routes/paths.dart';
import '../../../../widgets/custom_button.dart';
import '../../domain/use_case/qr_repo_use_case.dart';
import '../../widget/generate_qr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenCubit>(
      vmBuilder: (context) => HomeScreenCubit(locator<QrUseCase>()),
      listener: (context, state) => debugPrint(state.runtimeType.toString()),
      builder: (context, state) => _buildSuccessView(
        context,
        state as BaseCompletedState,
        context.read<HomeScreenCubit>(),
      ),
      errorBuilder: (context, state) => ErrorDialog(
        title: 'Error',
        message: state.errorMessage.toString() ?? '',
        resetState: () async {},
      ),
    );
  }

  Widget _buildSuccessView(
    BuildContext context,
    BaseCompletedState state,
    HomeScreenCubit cubit,
  ) =>
      buildSuccessWidget(cubit: cubit);

  Widget buildSuccessWidget({required HomeScreenCubit cubit}) {
    final userModel = cubit.userModel;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Scan Or Generate QR Code',
              style: K.boldBlackTextStyle(OneContext().context!),
            ),
            SizedBox(
                height:
                    MediaQuery.of(OneContext().context!).size.height * 0.02),
            Text(
              'Welcome  ${userModel?.email}',
              style: K.blackTextStyleLarge(OneContext().context!),
            ),
            Image.network(
              'https://editor.analyticsvidhya.com/uploads/89191cover2.jpg',
            ),
            K.sizedBoxH1,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  radius: 5.r,
                  width: 150.w,
                  borderColor: Colors.black,
                  backgroundColor: K.lightPrimaryColor,
                  showBorder: true,
                  borderWidth: 1.w,
                  textColor: K.gradientLightGreenColor,
                  buttonText: 'Generate',
                  onPressed: () {
                    Navigator.of(OneContext().context!).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const BuildBitmap();
                      },
                    ));
                  },
                ),
                K.sizedBoxW0,
                CustomButton(
                  radius: 5.r,
                  width: 150.w,
                  borderColor: Colors.black,
                  backgroundColor: K.gradientLightGreenColor,
                  showBorder: true,
                  borderWidth: 1.w,
                  buttonText: 'Scan',
                  onPressed: () {
                    Navigator.of(OneContext().context!).pushNamed(
                      AppPaths.qrScreen,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//     return BlocBuilder<HomeScreenCubit, BaseState>(
//       bloc: locator<HomeScreenCubit>(),
//       builder: (context, state) {
//         return Scaffold(
//           body: Center(
//             child:
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(' User namme'),
//                 Text(
//                   'Scan Or Generate Qr Code',
//                   style: K.boldBlackTextStyle(context),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Image.network(
//                     'https://editor.analyticsvidhya.com/uploads/89191cover2.jpg'),
//                 K.sizedBoxH1,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomButton(
//                       radius: 5.r,
//                       width: 150.w,
//                       borderColor: Colors.black,
//                       backgroundColor: K.lightPrimaryColor,
//                       showBorder: true,
//                       borderWidth: 1.w,
//                       textColor: K.gradientLightGreenColor,
//                       buttonText: 'Generate',
//                       onPressed: () {
//                         Navigator.of(context).push(
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return const BuildBitmap();
//                         }));
//                       },
//                     ),
//                     K.sizedBoxW0,
//                     CustomButton(
//                       radius: 5.r,
//                       width: 150.w,
//                       borderColor: Colors.black,
//                       backgroundColor: K.gradientLightGreenColor,
//                       showBorder: true,
//                       borderWidth: 1.w,
//                       buttonText: 'Scan',
//                       onPressed: () {
//                         Navigator.of(context).pushNamed(
//                           AppPaths.qrScreen,
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
