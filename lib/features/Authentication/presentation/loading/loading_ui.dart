




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:one_context/one_context.dart';

import '../../../../common/AppColors.dart';
import '../../../../routes/paths.dart';
import '../verfictaion-screen/cubit/verfictaion_screen_cubit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      if (VerificationScreenCubit.isAuthed) {
          OneContext().pushReplacementNamed(AppPaths.homeScreen);
      } else {
        OneContext().pushReplacementNamed(AppPaths.splash);

      }  });




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primaryAppColor,
       body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}//          emit(const VerificationScreenSuccess());

