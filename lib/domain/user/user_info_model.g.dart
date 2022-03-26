// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoModel _$$_UserInfoModelFromJson(Map<String, dynamic> json) =>
    _$_UserInfoModel(
      id: json['id'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      phone: json['phone'] as String?,
      profileImage: json['profileImage'] == null
          ? null
          : ImageModel.fromJson(json['profileImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserInfoModelToJson(_$_UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'phone': instance.phone,
      'profileImage': instance.profileImage?.toJson(),
    };
