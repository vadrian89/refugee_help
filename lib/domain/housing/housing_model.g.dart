// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'housing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HousingModel _$$_HousingModelFromJson(Map<String, dynamic> json) =>
    _$_HousingModel(
      id: json['id'] as String?,
      bedsAvailable: json['bedsAvailable'] as int? ?? 0,
      period: json['period'] as int? ?? 2,
      imageList: (json['imageList'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAvailable: json['isAvailable'] as bool? ?? true,
      hasTransport: json['hasTransport'] as bool? ?? true,
      country: json['country'] as String? ?? "Romania",
      countryIndex: json['countryIndex'] as String?,
      county: json['county'] as String?,
      countyIndex: json['countyIndex'] as String?,
      city: json['city'] as String?,
      cityIndex: json['cityIndex'] as String?,
      address: json['address'] as String?,
      addressIndex: json['addressIndex'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      type:
          json['type'] == null ? null : HousingTypeModel.fromJson(json['type']),
      createdAt: dateTimeFromJson(json['createdAt']),
      updatedAt: dateTimeFromJson(json['updatedAt']),
      remarks: json['remarks'] as String?,
      isMock: json['isMock'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HousingModelToJson(_$_HousingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bedsAvailable': instance.bedsAvailable,
      'period': instance.period,
      'imageList': instance.imageList?.map((e) => e.toJson()).toList(),
      'isAvailable': instance.isAvailable,
      'hasTransport': instance.hasTransport,
      'country': instance.country,
      'countryIndex': instance.countryIndex,
      'county': instance.county,
      'countyIndex': instance.countyIndex,
      'city': instance.city,
      'cityIndex': instance.cityIndex,
      'address': instance.address,
      'addressIndex': instance.addressIndex,
      'user': instance.user?.toJson(),
      'type': instance.type?.toJson(),
      'createdAt': dateTimeToJson(instance.createdAt),
      'updatedAt': dateTimeToJson(instance.updatedAt),
      'remarks': instance.remarks,
      'isMock': instance.isMock,
    };
