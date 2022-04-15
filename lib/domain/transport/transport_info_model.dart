// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';

import 'transport_model.dart';
import 'transport_type_model.dart';

part 'transport_info_model.freezed.dart';
part 'transport_info_model.g.dart';

@freezed
class TransportInfoModel with _$TransportInfoModel {
  const TransportInfoModel._();

  @JsonSerializable(explicitToJson: true)
  const factory TransportInfoModel({
    required String id,
    String? registrationNumber,
    @Default(0) int? seatsAvailable,
    TransportTypeModel? type,
    String? destinations,
    UserInfoModel? user,
    String? remarks,
  }) = _TransportInfoModel;

  /// Make a [TransportInfoModel] object from the incoming JSON.
  factory TransportInfoModel.fromJson(Map<String, dynamic> data) =>
      _$TransportInfoModelFromJson(data);

  factory TransportInfoModel.fromTransport(TransportModel model) => TransportInfoModel(
        id: model.id!,
        registrationNumber: model.registrationNumber,
        seatsAvailable: model.seatsAvailable,
        type: model.type,
        destinations: model.destinations,
        user: model.user,
        remarks: model.remarks,
      );

  TransportModel get toTransport => TransportModel.fromJson(toJson()).copyWith(id: id);
}
