
import 'package:freezed_annotation/freezed_annotation.dart';
import 'firebase_auth_error_handler/firebase_auth_error-handler.dart';
part 'firebase_result.freezed.dart';

@Freezed()
abstract class FirebaseResult<T> with _$FirebaseResult<T> {
  const factory FirebaseResult.success(AuthResultStatus status) = Success<T>;
  const factory FirebaseResult.failure(ErrorHandler errorHandler) = Failure<T>;
}