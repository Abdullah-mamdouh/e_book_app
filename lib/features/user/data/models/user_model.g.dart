// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      isActive: json['isActive'] as bool? ?? false,
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'isAdmin': instance.isAdmin,
      'isActive': instance.isActive,
    };
