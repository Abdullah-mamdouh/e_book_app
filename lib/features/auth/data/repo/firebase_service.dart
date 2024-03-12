
import 'package:e_book_app/features/user/data/models/user_model.dart';

import '../../../../core/networking/firebase_service/firebase_auth_error_handler/firebase_auth_error-handler.dart';
import '../../../../core/networking/service_result.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
abstract class FirebaseAuthService {
// Single Responsibility: Each Repository has a single responsibility,
// which is to provide data for a specific type of entity.
  //Stream<AuthUserModel> get authUser;

  Future<ServiceResult<AuthResultStatus>> signUp(UserModel user);

  Future<ServiceResult<AuthResultStatus>> signIn(LoginModel loginModel);

  Future<ServiceResult<void>> signOut();
}