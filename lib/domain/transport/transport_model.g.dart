// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransportModel _$$_TransportModelFromJson(Map<String, dynamic> json) =>
    _$_TransportModel(
      registrationNumber: json['registration_number'] as String?,
      seatsAvailable: json['seats_available'] as int? ?? 0,
      type: json['transport_type'] == null
          ? null
          : TransportTypeModel.fromJson(
              json['transport_type'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      atLocation: json['at_location'] as bool? ?? true,
      timeAvailable: json['time_available'] as int? ?? 0,
      isAvailable: json['is_available'] as bool? ?? false,
      from: json['from'] as String? ?? "Isaccea-Tulcea",
      destinations: json['destinations'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: dateTimeFromJson(json['updated_at']),
      updatedAt: dateTimeFromJson(json['created_at']),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$_TransportModelToJson(_$_TransportModel instance) =>
    <String, dynamic>{
      'registration_number': instance.registrationNumber,
      'seats_available': instance.seatsAvailable,
      'transport_type': instance.type?.toJson(),
      'image': instance.image?.toJson(),
      'at_location': instance.atLocation,
      'time_available': instance.timeAvailable,
      'is_available': instance.isAvailable,
      'from': instance.from,
      'destinations': instance.destinations,
      'user': instance.user?.toJson(),
      'updated_at': dateTimeToJson(instance.createdAt),
      'created_at': dateTimeToJson(instance.updatedAt),
      'remarks': instance.remarks,
    };
