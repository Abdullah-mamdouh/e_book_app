
import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  String bookURL;
  String authorName;
  String category;
  String coverImageURL;

  BookModel({required this.bookURL, required this.authorName, required this.category, required this.coverImageURL});

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);


}