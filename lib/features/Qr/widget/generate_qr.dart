import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scankit/flutter_scankit.dart';

import '../../../core/bases/base_state/base_cubit_state.dart';
import '../../../core/bases/base_view.dart';
import '../../../core/utils/dialog/error_dialog.dart';
import '../../../injection_container.dart';
import '../domain/use_case/qr_repo_use_case.dart';
import '../presentation/cubit/home_screen_cubit.dart';

class BuildBitmap extends StatelessWidget {


  const BuildBitmap({Key? key, }) : super(key: key);


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
      screenBody(state ,context.read<HomeScreenCubit>());
}


  Widget   screenBody(BaseCompletedState state, HomeScreenCubit cubit){
  return Container(
         alignment: Alignment.center,
         padding: const EdgeInsets.all(16),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [

             cubit.image == null
                 ? const SizedBox(
                 width: 200,
                 height: 200,
                 child: Placeholder(
                   strokeWidth: 1,
                 ))
                 : Image(image: cubit.image!),
             const SizedBox(
               height: 16,
             ),
             TextField(
               controller: cubit.controller,
             ),
             const SizedBox(
               height: 16,
             ),
             OutlinedButton(
               child: const Text("Generate"),
               onPressed: () async {
                 cubit. generate();
               },
             ),
           ],
         ),

      );
  }
// }
