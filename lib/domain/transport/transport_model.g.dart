// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransportModel _$$_TransportModelFromJson(Map<String, dynamic> json) =>
    _$_TransportModel(
      registrationNumber: json['registrationNumber'] as String?,
      seatsAvailable: json['seatsAvailable'] as int? ?? 0,
      type: json['type'] == null
          ? null
          : TransportTypeModel.fromJson(json['type']),
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      atLocation: json['atLocation'] as bool? ?? true,
      timeAvailable: json['timeAvailable'] as int? ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? false,
      destinations: json['destinations'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: dateTimeFromJson(json['createdAt']),
      updatedAt: dateTimeFromJson(json['updatedAt']),
      remarks: json['remarks'] as String?,
      isMock: json['isMock'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TransportModelToJson(_$_TransportModel instance) =>
    <String, dynamic>{
      'registrationNumber': instance.registrationNumber,
      'seatsAvailable': instance.seatsAvailable,
      'type': instance.type?.toJson(),
      'image': instance.image?.toJson(),
      'atLocation': instance.atLocation,
      'timeAvailable': instance.timeAvailable,
      'isAvailable': instance.isAvailable,
      'destinations': instance.destinations,
      'user': instance.user?.toJson(),
      'createdAt': dateTimeToJson(instance.createdAt),
      'updatedAt': dateTimeToJson(instance.updatedAt),
      'remarks': instance.remarks,
      'isMock': instance.isMock,
    };
