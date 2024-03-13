import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import 'features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'features/user/logic/user_cubit/user_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<UserCubit>(
          create: (context) => getIt<UserCubit>(),
        ),

        BlocProvider<SignInCubit>(
          create: (context) => getIt<SignInCubit>(),
        ),
        BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            title: 'My App',
            theme: ThemeData(
              //primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.onBoardingScreen,
            onGenerateRoute: appRouter.generateRoute,
          )),
    );
  }
}
