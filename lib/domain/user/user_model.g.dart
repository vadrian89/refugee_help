// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      category: UserCategoryModel.fromJson(json['category']),
      email: json['email'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      phone: json['phone'] as String?,
      county: json['county'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      profileImage: json['profileImage'] == null
          ? null
          : ImageModel.fromJson(json['profileImage'] as Map<String, dynamic>),
      organization: json['organization'] as String?,
      isAvailable: json['isAvailable'] as bool? ?? false,
      createdAt: dateTimeFromJson(json['createdAt']),
      updatedAt: dateTimeFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': UserCategoryModel.toJson(instance.category),
      'email': instance.email,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'phone': instance.phone,
      'county': instance.county,
      'city': instance.city,
      'address': instance.address,
      'profileImage': instance.profileImage?.toJson(),
      'organization': instance.organization,
      'isAvailable': instance.isAvailable,
      'createdAt': dateTimeToJson(instance.createdAt),
      'updatedAt': dateTimeToJson(instance.updatedAt),
    };
