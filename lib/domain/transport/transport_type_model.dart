import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TransportTypeModel extends Equatable {
  final int id;
  final String name;
  final String seats;
  final IconData icon;

  const TransportTypeModel({
    required this.id,
    required this.name,
    required this.seats,
    required this.icon,
  });

  factory TransportTypeModel.car() => TransportTypeModel(
        id: 1,
        name: "car".tr(),
        seats: "car_seats".tr(),
        icon: MdiIcons.car,
      );

  factory TransportTypeModel.microBus() => TransportTypeModel(
        id: 2,
        name: "micro_bus".tr(),
        seats: "micro_bus_seats".tr(),
        icon: MdiIcons.vanPassenger,
      );

  factory TransportTypeModel.bus() => TransportTypeModel(
        id: 3,
        name: "bus".tr(),
        seats: "bus_seats".tr(),
        icon: MdiIcons.bus,
      );

  factory TransportTypeModel.fromJson(Map<String, dynamic> json) => TransportTypeModel.fromId(
        int.tryParse(json["type"]?.toString() ?? "1")!,
      );

  factory TransportTypeModel.fromId(int id) => list.firstWhere((element) => element.id == id);

  Map<String, dynamic> toJson() => {"type": id};

  @override
  List<Object?> get props => [id, name, seats];

  static List<TransportTypeModel> get list => [
        TransportTypeModel.car(),
        TransportTypeModel.microBus(),
        TransportTypeModel.bus(),
      ];
}
