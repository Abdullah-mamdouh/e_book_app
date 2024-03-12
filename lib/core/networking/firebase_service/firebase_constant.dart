

import 'package:firebase_core/firebase_core.dart';

/// init options of firebase
 const firebaseOptions  = FirebaseOptions(
    apiKey: "AIzaSyDshn-ePSi8Wwm5VTRB3M1gY2zpJPZyFFU",
    appId: "1:874048799407:android:17dd5e1124da6432f88a5a",
    messagingSenderId: "874048799407",
    projectId: "loc-camp-app");

 /// expected errors of firebase auth
class FirebaseErrors {
  // static const String successful =
  //     "Your email address appears to be malformed.";
  static const String emailAlreadyExists = "Signing in with Email and Password is not enabled.";
  static const String invalidCredential = "Email or Password is incorrect";
  static const String wrongPassword = "Your password is wrong.";
  static const String invalidEmail = "User with this email doesn't exist.";
  static const String userNotFound = "Too many requests. Try again later.";
  static const String userDisabled = "User with this email has been disabled.";

  static const String operationNotAllowed =
      "Signing in with Email and Password is not enabled.";
  static const String tooManyRequests =
      "The email has already been registered. Please login or reset your password.";
  static const String undefined = "An undefined Error happened.";
}
