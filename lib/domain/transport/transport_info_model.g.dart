// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransportInfoModel _$$_TransportInfoModelFromJson(
        Map<String, dynamic> json) =>
    _$_TransportInfoModel(
      id: json['id'] as String,
      registrationNumber: json['registrationNumber'] as String?,
      seatsAvailable: json['seatsAvailable'] as int? ?? 0,
      type: json['type'] == null
          ? null
          : TransportTypeModel.fromJson(json['type']),
      destinations: json['destinations'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$_TransportInfoModelToJson(
        _$_TransportInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registrationNumber': instance.registrationNumber,
      'seatsAvailable': instance.seatsAvailable,
      'type': instance.type?.toJson(),
      'destinations': instance.destinations,
      'user': instance.user?.toJson(),
      'remarks': instance.remarks,
    };
