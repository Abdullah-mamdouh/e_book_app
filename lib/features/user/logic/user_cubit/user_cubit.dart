import 'dart:convert';

import 'package:e_book_app/features/user/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/internet_checker.dart';
import '../../../auth/data/models/login_model.dart';
import '../../data/repo/user_repo.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  //final InternetCheckerImpl internetChecher;
  final UserRepo userRepo;
  UserCubit({//required this.internetChecher,
    required this.userRepo}) : super(const UserState.initial());

  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);

  emitaddUserStates(UserModel userModel) async {
    emit(const UserState.loading());
    //if(await internetChecher.isConnected){
      final response = await userRepo.addUser(userModel);
      response.when(success: (user) {
        //emit(UserState.success(user));
      }, failure: (error) {
        emit(UserState.error(error: error.errorModel.message ?? ''));
      });
    // }
    // else {
    //   emit(UserState.error(error: 'No Internet Connection' ?? ''));
    // }
  }


}
