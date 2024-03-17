

import 'dart:io';
import 'dart:typed_data';

import 'package:e_book_app/core/service/firebase_storage_service/firebase_storage_service.dart';
import 'package:e_book_app/features/book/data/models/book_model.dart';

import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/service_result.dart';
import '../../../../core/service/firebase_cloud_service/firebase_cloud_service.dart';
import '../../../user/data/models/user_model.dart';

class BookRepo {
  //InternetCheckerImpl internetChecker;
  FirebaseStorageService firebaseStorageService;
  FirebaseCloudService firebaseCloudService;

  BookRepo(
      {
        required this.firebaseStorageService,
        required this.firebaseCloudService,
        //required this.internetChecker
      });


  Future<ServiceResult<UserModel>>addBook(BookModel bookModel) async{
    try {
      final response = await firebaseCloudService.addBook(bookModel);
      return ServiceResult.success(response);
    }catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
  }

  Future<ServiceResult<String>>uploadFile(Uint8List file,String type) async{
    try {
      final response = await firebaseStorageService.uploadFileToStorage(type: type, file: file);
      return ServiceResult.success(response);
    }catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
  }
  /*
  Future<ServiceResult<String>>uploadImage(File file,String type) async{
    try {
      final response = await firebaseStorageService.uploadImageToStorage(type: type, file: file);
      print('adadddddddddddddddddddddddddddddddddddddddddddddddddddddd');
      return ServiceResult.success(response);
    }catch (errro) {
      print('$errro wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
  }
  */

  Future<ServiceResult<List<BookModel>>>getAllBooks() async{
    try {
      final response = await firebaseCloudService.getAllBooks();
      return ServiceResult.success(response);
    }catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)));
    }
  }

}