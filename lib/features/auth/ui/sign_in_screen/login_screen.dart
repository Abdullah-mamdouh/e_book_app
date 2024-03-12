
import 'package:flutter/material.dart';
import '../../logic/sign_in_cubit/sign_in_cubit.dart';
import 'widgets/sign_in_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  @override
  void initState() {
    super.initState();
    SignInCubit.get(context).fetchUserLoginCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninWidget(),
    );
  }
}
