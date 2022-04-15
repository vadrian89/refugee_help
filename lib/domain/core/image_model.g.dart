// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageModel _$$_ImageModelFromJson(Map<String, dynamic> json) =>
    _$_ImageModel(
      fileExtension: json['fileExtension'] as String?,
      imageURL: json['imageURL'] as String?,
      storagePath: json['storagePath'] as String?,
    );

Map<String, dynamic> _$$_ImageModelToJson(_$_ImageModel instance) =>
    <String, dynamic>{
      'fileExtension': instance.fileExtension,
      'imageURL': instance.imageURL,
      'storagePath': instance.storagePath,
    };
