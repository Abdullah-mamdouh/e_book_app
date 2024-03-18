import 'package:e_book_app/core/utils/config_size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/networking/firebase_service/firebase_constant.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
    await Firebase.initializeApp(options: firebaseConfig);
  // } else {
  //   await Firebase.initializeApp();
  // }
  await setupGetIt();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
