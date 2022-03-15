// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      category: UserCategoryModel.fromJson(json['category']),
      email: json['email'] as String?,
      lastName: json['last_name'] as String?,
      firstName: json['first_name'] as String?,
      phone: json['phone'] as String?,
      county: json['county'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      profileImage: json['profile_image'] == null
          ? null
          : ImageModel.fromJson(json['profile_image'] as Map<String, dynamic>),
      organization: json['organization'] as String?,
      isAvailable: json['is_available'] as bool? ?? false,
      createdAt: dateTimeFromJson(json['created_at']),
      updatedAt: dateTimeFromJson(json['updated_at']),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': UserCategoryModel.toJson(instance.category),
      'email': instance.email,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'phone': instance.phone,
      'county': instance.county,
      'city': instance.city,
      'address': instance.address,
      'profile_image': instance.profileImage?.toJson(),
      'organization': instance.organization,
      'is_available': instance.isAvailable,
      'created_at': dateTimeToJson(instance.createdAt),
      'updated_at': dateTimeToJson(instance.updatedAt),
    };
