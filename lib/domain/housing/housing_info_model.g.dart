// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'housing_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HousingInfoModel _$$_HousingInfoModelFromJson(Map<String, dynamic> json) =>
    _$_HousingInfoModel(
      id: json['id'] as String?,
      bedsAvailable: json['bedsAvailable'] as int? ?? 0,
      period: json['period'] as int? ?? 2,
      address: json['address'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$_HousingInfoModelToJson(_$_HousingInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bedsAvailable': instance.bedsAvailable,
      'period': instance.period,
      'address': instance.address,
      'user': instance.user?.toJson(),
      'remarks': instance.remarks,
    };
