// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoModel _$$_UserInfoModelFromJson(Map<String, dynamic> json) =>
    _$_UserInfoModel(
      id: json['id'] as String,
      lastName: json['last_name'] as String,
      firstName: json['first_name'] as String,
      phone: json['phone'] as String,
      profileImage:
          ImageModel.fromJson(json['profile_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserInfoModelToJson(_$_UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'phone': instance.phone,
      'profile_image': instance.profileImage.toJson(),
    };
