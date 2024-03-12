
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_state.freezed.dart';

@freezed
class UserState<T> with _$UserState<T>{
  const factory UserState.initial() = _Initial;

  const factory UserState.loading() = Loading;
  const factory UserState.success(T data) = Success<T>;
  const factory UserState.error({required String error}) = Error;
}
