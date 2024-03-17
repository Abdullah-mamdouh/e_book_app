

import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_state.freezed.dart';

@freezed
class BookState<T> with _$BookState<T>{
  const factory BookState.initial() = _Initial;

  const factory BookState.loading() = Loading;
  const factory BookState.success(T data) = Success<T>;
  const factory BookState.error({required String error}) = Error;

  const factory BookState.loadingImage() = LoadingImage;
  const factory BookState.loadingPDF() = LoadingPDF;
  const factory BookState.loadedImage() = LoadedImage;
  const factory BookState.loadedPDF() = LoadedPDF;
}
