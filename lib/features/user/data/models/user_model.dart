
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final bool? isActive;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    this.isActive = false,

  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
