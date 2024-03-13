import 'package:e_book_app/features/user/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/networking/error_handler_base.dart';
import '../../../../core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import '../../../../core/networking/service_result.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import 'firebase_service.dart';

class AuthRepo extends FirebaseAuthService{
  final FirebaseAuth auth ;

  AuthRepo(this.auth);
  @override
  Future<ServiceResult<AuthResultStatus>> signIn(LoginModel loginModel) async{
    try{
            final UserCredential response = await auth.signInWithEmailAndPassword(
              email: loginModel.email,
              password: loginModel.password,
            );
            if(response.user != null ){
              print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+response.user.toString()+'ssssssssssssssssssssssssssssssssssssssssss');
              return ServiceResult.success(AuthResultStatus.successful);
            }else{
              return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
            }
          } catch (errro) {
            return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)) );
          }

  }

  @override
  Future<ServiceResult<void>> signOut() async{
    try {
     final response =  await auth.signOut();
     return ServiceResult.success(AuthResultStatus.successful);
    } catch (error) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(error)));
    }
  }

  @override
  Future<ServiceResult<String>> signUp(String email, String password) async{
    try{
      final UserCredential response = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+response.toString()+'ssssssssssssssssssssssssssssssssssssssssss');
      if(response.user != null ){
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'+response.user.toString()+'ssssssssssssssssssssssssssssssssssssssssss');

        return ServiceResult.success(response.user!.uid);
      }else{
        return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(AuthResultStatus.unknown)));
      }
      } catch (errro) {
      return ServiceResult.failure(Handler.handle(ErrorHandlerAuth(errro)) );
    }
  }
}
