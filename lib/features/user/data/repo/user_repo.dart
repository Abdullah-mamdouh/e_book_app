

import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/internet_checker.dart';
import '../../../../core/networking/service_result.dart';
import '../../../../core/service/firebase_cloud_service/firebase_cloud_service.dart';
import '../models/user_model.dart';

class UserRepo {
  //InternetCheckerImpl internetChecker;
  FirebaseCloudService firebaseCloudService;

  UserRepo(
      {
        required this.firebaseCloudService,
        //required this.internetChecker
      });

  Future<ServiceResult<UserModel>>addUser(UserModel userModel) async{

    // if(await internetChecker.isConnected){
      try {
        final response = await firebaseCloudService.addUser(userModel);
        return ServiceResult.success(response);
      }catch (errro) {
        return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
      }
    // }
    // else {
    //   return ServiceResult.failure(Handler.handle(ErrorHandlerAuth('No Internet')));
    // }

  }

  Future<ServiceResult<UserModel>>updateUser(UserModel userModel) async{

    // if(await internetChecker.isConnected){
      try {
        final response = await firebaseCloudService.updateUser(userModel);
        return ServiceResult.success(response);
      }catch (errro) {
        return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
      }
    // }
    // else {
    //   return ServiceResult.failure(Handler.handle(ErrorHandlerAuth('No Internet')));
    // }

  }

  Future<ServiceResult<UserModel>>getUser(String id) async{

    // if(await internetChecker.isConnected){
    try {
      final response = await firebaseCloudService.getUser(id);
      return ServiceResult.success(response);
    }catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
    // }
    // else {
    //   return ServiceResult.failure(Handler.handle(ErrorHandlerAuth('No Internet')));
    // }

  }

  Future<ServiceResult<List<UserModel>>>getAllUsersNotCtive() async{

    // if(await internetChecker.isConnected){
    try {
      final response = await firebaseCloudService.getNotActiveUsers();
      return ServiceResult.success(response);
    }catch (errro) {
      print('$errro 3333333333333333333333333');
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
    // }
    // else {
    //   return ServiceResult.failure(Handler.handle(ErrorHandlerAuth('No Internet')));
    // }

  }

}