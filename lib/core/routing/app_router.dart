import 'package:e_book_app/features/book/ui/adding_book_screen/adding_book.dart';
import 'package:e_book_app/features/book/ui/books_screen/books_screen.dart';
import 'package:e_book_app/features/book/ui/pdf_view_screen/pdf_view_screen.dart';
import 'package:e_book_app/features/user/ui/ative_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/auth/ui/sign_in_screen/login_screen.dart';
import '../../features/auth/ui/sign_up_screen/sign_up_screen.dart';
import '../../splash_screen/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return PageTransition(
        type: PageTransitionType.bottomToTop, duration: Duration(milliseconds:500 ),
        child: OnBoardingScreen(),);
      case Routes.loginScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade,duration: Duration(milliseconds:500 ),
          child: const SigninScreen(),);
      case Routes.signupScreen:
        return PageTransition(
          type: PageTransitionType.bottomToTop,duration: Duration(milliseconds:500 ),
          child: const SignupScreen(),);
      case Routes.booksScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade, duration: Duration(milliseconds:500 ),
          child: const BooksScreen(),);
      case Routes.addBookScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade, duration: Duration(milliseconds:500 ),
          child: const AddingBook(),);
      case Routes.activeUserScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade, duration: Duration(milliseconds:500 ),
          child: const ActiveUserScreen(),);
      case Routes.pdfViewScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade, duration: Duration(milliseconds:500 ),
          child: PDFViewScreen(pdfURL: settings.arguments.toString()),);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
