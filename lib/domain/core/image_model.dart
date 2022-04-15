// ignore_for_file: invalid_annotation_target

import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();

  bool get isLocal => imageData != null;
  bool get isValid => (imageURL?.isNotEmpty ?? false) || isLocal;

  const factory ImageModel({
    @JsonKey(ignore: true) Uint8List? imageData,
    String? fileExtension,
    String? imageURL,
    String? storagePath,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> data) => _$ImageModelFromJson(data);
}
