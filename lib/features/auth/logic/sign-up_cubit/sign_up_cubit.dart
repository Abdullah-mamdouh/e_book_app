import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../../user/data/models/user_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/register_model.dart';
import '../../data/repo/auth_repo.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  //final InternetCheckerImpl internetChecher;
  SignupCubit(this._authRepo,// this.internetChecher
      ) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveUserLoginCredentials(LoginModel loginCredentials) async {
    final preferences = await getPreferences();
    preferences.setString(
        'LoginCredentials', jsonEncode(loginCredentials.toJson()));
  }
  late UserModel userModel;
  emitSignupStates() async {
    emit(const SignupState.loading());
    //if(await internetChecher.isConnected){

      final response = await _authRepo.signUp(emailController.text, passwordController.text);
      response.when(success: (user) {
        emit(SignupState.success(user));
        userModel = UserModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          id: user,
        );
        saveUserLoginCredentials(LoginModel(email: emailController.text, password: passwordController.text));
        //debugPrint(registerModel.toString());
      }, failure: (error) {
        emit(SignupState.error(error: error.errorModel.message ?? ''));
      });
    // }
    // else {
    //   emit(SignupState.error(error: 'No Internet Connection' ?? ''));
    // }
  }


}
