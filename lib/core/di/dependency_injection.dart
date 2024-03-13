import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:e_book_app/core/service/firebase_cloud_service/firebase_cloud_service.dart';
import 'package:e_book_app/features/user/data/repo/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import '../../features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import '../../features/user/logic/user_cubit/user_cubit.dart';
import '../networking/internet_checker.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  /// Internet Connection Checker
  // final internetChecker = InternetConnectionChecker();
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton<InternetCheckerImpl>(() => InternetCheckerImpl(getIt()));

  // firebaseAuth
  final firebaseauth = FirebaseAuth.instance;
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(firebaseauth));
  /// create instance from SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  /// Register cubit
  getIt.registerFactory(() => SignupCubit(getIt(), //getIt()
  ));

  /// login cubit
  getIt.registerFactory(() =>
      SignInCubit(//internetChecker: getIt(),
          authRepo: getIt(),
          sharedPreferences: sharedPreferences));

  /// cloud firestore
  final cloudFirestore = FirebaseFirestore.instance;
  /// Firebase Cloud Service
  getIt.registerLazySingleton<FirebaseCloudService>(() => FirebaseCloudService(firebaseFirestore: cloudFirestore));

  /// User Repo
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(//internetChecker: getIt(),
      firebaseCloudService: getIt()));
  /// Register cubit
  getIt.registerFactory(() => UserCubit(//internetChecher: getIt(),
      userRepo: getIt()));

  /// Dio & NotificationAPI
  // Dio dio = DioFactory.getDio()


}
