// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'data': instance.data,
    };
