// ignore_for_file: invalid_annotation_target

import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

part 'ticket_status_model.freezed.dart';
part 'ticket_status_model.g.dart';

@freezed
class TicketStatusModel with _$TicketStatusModel {
  const TicketStatusModel._();

  const factory TicketStatusModel({
    required int id,
    @JsonKey(ignore: true) String? name,
    @JsonKey(ignore: true) IconData? icon,
    @JsonKey(ignore: true) Color? color,
  }) = _TicketStatusModel;

  factory TicketStatusModel.created() => TicketStatusModel(
        id: 1,
        name: "created".tr(),
        icon: MdiIcons.timerSand,
        color: Colors.orange,
      );

  factory TicketStatusModel.started() => TicketStatusModel(
        id: 2,
        name: "started".tr(),
        icon: MdiIcons.carSide,
        color: Colors.blue,
      );

  factory TicketStatusModel.finished() => TicketStatusModel(
        id: 3,
        name: "finished".tr(),
        icon: MdiIcons.check,
        color: Colors.green,
      );

  factory TicketStatusModel.canceled() => TicketStatusModel(
        id: 4,
        name: "canceled".tr(),
        icon: MdiIcons.cancel,
        color: Colors.red,
      );

  factory TicketStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusModelFromJson(json);

  TicketStatusModel get updated => list.firstWhere(
        (element) => element.id == id,
        orElse: () => TicketStatusModel.created(),
      );

  static List<TicketStatusModel> get list => [
        TicketStatusModel.created(),
        TicketStatusModel.started(),
        TicketStatusModel.finished(),
        TicketStatusModel.canceled(),
      ];
}
