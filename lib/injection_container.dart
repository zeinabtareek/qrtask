import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:qrtask/features/Qr/domain/repo/qr_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/Authentication/data/local/auth_local_data_source.dart';
import 'features/Authentication/data/repo-imp/auth_repo_imp.dart';
import 'features/Authentication/data/services/local/local_auth.dart';
import 'features/Authentication/data/services/remote/remote_auth.dart';
import 'features/Authentication/domain/repo/auth_repo.dart';
import 'features/Authentication/domain/use-cases/auth_cases.dart';
import 'features/Authentication/presentation/login/controller/login_with_pass_CUBIT.dart';
import 'features/Authentication/presentation/sign-up/cubit/sign_up_cubit.dart';
import 'features/Authentication/presentation/verfictaion-screen/cubit/verfictaion_screen_cubit.dart';
import 'features/Qr/data/repo_imp/qr_repo_imp.dart';
import 'features/Qr/data/services/remote/remote_qr.dart';
import 'features/Qr/domain/use_case/qr_repo_use_case.dart';
import 'features/Qr/presentation/cubit/home_screen_cubit.dart';
import 'helpers/Cache/cache_helper.dart';


final locator = GetIt.instance;
final getIt = locator();
setUpInitializeApp() async {
///Localization
//   locator.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());

  ///Cache data
  final sharedPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => sharedPref);

  await CacheHelper.init();


  // locator.registerSingleton<DioClient>(DioClient());




   /*************Cubit***************/


  ///0- on boarding
//   locator.registerLazySingleton<OnBoardingControllerCubit>(() => OnBoardingControllerCubit());
   ///1- Auth

  locator.registerLazySingleton<LoginWithPassCubit>(() => LoginWithPassCubit(locator<AuthCases>()));
  locator.registerLazySingleton<HomeScreenCubit>(() => HomeScreenCubit(locator<QrUseCase>()));
  locator.registerLazySingleton<SignUpCubit>(() => SignUpCubit(locator<AuthCases>()));
  locator.registerLazySingleton<VerificationScreenCubit>(() => VerificationScreenCubit( ));
  // locator.registerLazySingleton<LogoutCubit>(() => LogoutCubit( ));

//   locator.registerLazySingleton<ForgotPasswordCubit>(() => ForgotPasswordCubit( locator<AuthCases>()));
//    ///2- request
//
//    ///3- Wallet
//   locator.registerLazySingleton<MyPointCubit>(() => MyPointCubit(locator<PointsRepo>() ));
//   locator.registerLazySingleton<ReferralsCubit>(() => ReferralsCubit( locator<PointsRepo>()));
//    ///4- Profile
//
//   locator.registerLazySingleton<EditProfileCubit>(() => EditProfileCubit(locator<EditProfileRepo>() ));
//   locator.registerLazySingleton<ResetPasswordCubit>(() => ResetPasswordCubit(locator<AuthCases>() ));
//
//
// ///5- settings
//
//   locator.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
//   locator.registerLazySingleton<SettingsCubit>(() => SettingsCubit(locator<ApiService>()));
//
//
//
//
//
//   /*************UseCases***************/
//
//    ///1- Auth

  locator.registerLazySingleton<AuthCases>(() => AuthCases(locator<AuthRepoImp>()));
  locator.registerLazySingleton<QrUseCase>(() => QrUseCase(locator<QrRepoImp>()));
  // locator.registerLazySingleton<RemoteApiAuth>(() => RemoteApiAuth(DioClient.instance));
  // locator.registerLazySingleton<RemoteDataSource>(() => RemoteDatasourceImpl(FirebaseAuth.instance));
  locator.registerLazySingleton<RemoteDatasourceImpl>(() => RemoteDatasourceImpl(FirebaseAuth.instance));

  locator.registerLazySingleton<LocalAuth>(() => LocalAuth());
  locator.registerLazySingleton<BaseAuthLocalDataSource>(
        () => AuthLocalDataSource(sharedPreferences: locator()),
  );
  locator.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSource(sharedPreferences: locator()),
  );
//
//
//
//   ///2- request
//   locator.registerSingleton<NetworkService>(NetworkService(locator<DioClient>()));
//   locator.registerSingleton<ApiService>(ApiService(locator<NetworkService>()));
//   locator.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(locator<ApiService>()));
//     ///3- Wallet
//
//
//
//
//
//
//
//
//
//
//   /*************Repo**************/
  ///1- Auth

  locator.registerLazySingleton<AuthRepo>(
        () => AuthRepoImp(
      remoteApiAuth: locator(),
      localAuth: locator(),
    ),
  );
  locator.registerLazySingleton<AuthRepoImp>(
        () => AuthRepoImp(
      remoteApiAuth: locator(),
      localAuth: locator(),
    ),
  );

  locator.registerLazySingleton<RemoteQrDataSource>(() => RemoteQrDataSourceImp());
  // locator.registerLazySingleton<QrUseCase>(() => QrUseCase(locator<QrRepoImp>()));

  locator.registerLazySingleton<QrRepoImp>(
        () => QrRepoImp( locator<RemoteQrDataSource>() ),
  );


//   ///3- Wallet
//   locator.registerLazySingleton<PointsRepo>(
//         () => PointsRepo(locator<ApiService>()  ),
//   );
//
//   ///4- profile



}
