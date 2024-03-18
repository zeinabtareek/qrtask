import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrtask/features/Qr/domain/use_case/qr_repo_use_case.dart';
import '../features/Authentication/domain/use-cases/auth_cases.dart';
import '../features/Authentication/presentation/loading/loading_ui.dart';
import '../features/Authentication/presentation/login/controller/login_with_pass_CUBIT.dart';
import '../features/Authentication/presentation/login/ui/login_screen.dart';
import '../features/Authentication/presentation/sign-up/cubit/sign_up_cubit.dart';
import '../features/Authentication/presentation/sign-up/sign_up.dart';
import '../features/Authentication/presentation/verfictaion-screen/add_phone_screen.dart';
import '../features/Authentication/presentation/verfictaion-screen/cubit/verfictaion_screen_cubit.dart';
import '../features/Authentication/presentation/verfictaion-screen/verification_screen.dart';
import '../features/Qr/presentation/cubit/home_screen_cubit.dart';
import '../features/Qr/presentation/home_screen/home_screen.dart';
import '../features/Qr/presentation/home_screen/qr_screen.dart';
import '../injection_container.dart';
import 'paths.dart';

class AppRouteManger {
  static String get initial {
    if (!VerificationScreenCubit.isAuthed) {
      return AppPaths.loginWithPass;
    } else {
      return AppPaths.loadingScreen;
    }
  }

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppPaths.loginWithPass:
        return _materialRoute(BlocProvider(
          create: (context) => LoginWithPassCubit(locator<AuthCases>()),
          child: SignInScreen(),
        ));

      case AppPaths.signUp:
        return _materialRoute(BlocProvider(
          create: (context) => SignUpCubit(locator<AuthCases>()),
          child: SignUpScreen(),
        ));

      case AppPaths.homeScreen:
        return _materialRoute(BlocProvider(
          create: (context) => HomeScreenCubit(locator<QrUseCase>()),
          child: HomeScreen(),
          // QRScannerWidget(),
        ));
      //
      case AppPaths.qrScreen:
        return _materialRoute(BlocProvider(
          create: (context) => HomeScreenCubit(locator<QrUseCase>()),
          child: QRScannerWidget(),
        ));
      case AppPaths.addPhoneScreen: //phone

        return _materialRoute(
          BlocProvider<VerificationScreenCubit>(
              create: (context) => VerificationScreenCubit(),
              child: AddPhoneScreen()
              // ),
              ),
        );
      case AppPaths.loadingScreen:
        return _materialRoute(
          const LoadingScreen(),
        );

      case AppPaths.verificationScreen:
        var args = (settings.arguments ?? {}) as Map<String, dynamic>;

        return _materialRoute(BlocProvider(
          create: (context) => VerificationScreenCubit(),
          child: VerificationScreen(
              number: args["nums"],
              otpState: args["otpState"]),
        ));
      default:
        return _materialRoute(const Scaffold());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
