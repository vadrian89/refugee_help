// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return _ImageModel.fromJson(json);
}

/// @nodoc
class _$ImageModelTearOff {
  const _$ImageModelTearOff();

  _ImageModel call(
      {@JsonKey(ignore: true) Uint8List? imageData,
      String? fileExtension,
      String? imageURL,
      String? storagePath}) {
    return _ImageModel(
      imageData: imageData,
      fileExtension: fileExtension,
      imageURL: imageURL,
      storagePath: storagePath,
    );
  }

  ImageModel fromJson(Map<String, Object?> json) {
    return ImageModel.fromJson(json);
  }
}

/// @nodoc
const $ImageModel = _$ImageModelTearOff();

/// @nodoc
mixin _$ImageModel {
  @JsonKey(ignore: true)
  Uint8List? get imageData => throw _privateConstructorUsedError;
  String? get fileExtension => throw _privateConstructorUsedError;
  String? get imageURL => throw _privateConstructorUsedError;
  String? get storagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) Uint8List? imageData,
      String? fileExtension,
      String? imageURL,
      String? storagePath});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res> implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  final ImageModel _value;
  // ignore: unused_field
  final $Res Function(ImageModel) _then;

  @override
  $Res call({
    Object? imageData = freezed,
    Object? fileExtension = freezed,
    Object? imageURL = freezed,
    Object? storagePath = freezed,
  }) {
    return _then(_value.copyWith(
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      fileExtension: fileExtension == freezed
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      storagePath: storagePath == freezed
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ImageModelCopyWith<$Res> implements $ImageModelCopyWith<$Res> {
  factory _$ImageModelCopyWith(
          _ImageModel value, $Res Function(_ImageModel) then) =
      __$ImageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) Uint8List? imageData,
      String? fileExtension,
      String? imageURL,
      String? storagePath});
}

/// @nodoc
class __$ImageModelCopyWithImpl<$Res> extends _$ImageModelCopyWithImpl<$Res>
    implements _$ImageModelCopyWith<$Res> {
  __$ImageModelCopyWithImpl(
      _ImageModel _value, $Res Function(_ImageModel) _then)
      : super(_value, (v) => _then(v as _ImageModel));

  @override
  _ImageModel get _value => super._value as _ImageModel;

  @override
  $Res call({
    Object? imageData = freezed,
    Object? fileExtension = freezed,
    Object? imageURL = freezed,
    Object? storagePath = freezed,
  }) {
    return _then(_ImageModel(
      imageData: imageData == freezed
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      fileExtension: fileExtension == freezed
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      storagePath: storagePath == freezed
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageModel extends _ImageModel {
  const _$_ImageModel(
      {@JsonKey(ignore: true) this.imageData,
      this.fileExtension,
      this.imageURL,
      this.storagePath})
      : super._();

  factory _$_ImageModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageModelFromJson(json);

  @override
  @JsonKey(ignore: true)
  final Uint8List? imageData;
  @override
  final String? fileExtension;
  @override
  final String? imageURL;
  @override
  final String? storagePath;

  @override
  String toString() {
    return 'ImageModel(imageData: $imageData, fileExtension: $fileExtension, imageURL: $imageURL, storagePath: $storagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageModel &&
            const DeepCollectionEquality().equals(other.imageData, imageData) &&
            const DeepCollectionEquality()
                .equals(other.fileExtension, fileExtension) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality()
                .equals(other.storagePath, storagePath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageData),
      const DeepCollectionEquality().hash(fileExtension),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(storagePath));

  @JsonKey(ignore: true)
  @override
  _$ImageModelCopyWith<_ImageModel> get copyWith =>
      __$ImageModelCopyWithImpl<_ImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageModelToJson(this);
  }
}

abstract class _ImageModel extends ImageModel {
  const factory _ImageModel(
      {@JsonKey(ignore: true) Uint8List? imageData,
      String? fileExtension,
      String? imageURL,
      String? storagePath}) = _$_ImageModel;
  const _ImageModel._() : super._();

  factory _ImageModel.fromJson(Map<String, dynamic> json) =
      _$_ImageModel.fromJson;

  @override
  @JsonKey(ignore: true)
  Uint8List? get imageData;
  @override
  String? get fileExtension;
  @override
  String? get imageURL;
  @override
  String? get storagePath;
  @override
  @JsonKey(ignore: true)
  _$ImageModelCopyWith<_ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
