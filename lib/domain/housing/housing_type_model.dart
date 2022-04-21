import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HousingTypeModel extends Equatable {
  final int id;
  final String name;
  final IconData icon;

  const HousingTypeModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory HousingTypeModel.host() => HousingTypeModel(
        id: 1,
        name: "host".tr(),
        icon: MdiIcons.homeCity,
      );

  factory HousingTypeModel.pension() => HousingTypeModel(
        id: 2,
        name: "pension".tr(),
        icon: MdiIcons.bedOutline,
      );

  factory HousingTypeModel.hotel() => HousingTypeModel(
        id: 3,
        name: "hotel".tr(),
        icon: MdiIcons.bed,
      );

  factory HousingTypeModel.institution() => HousingTypeModel(
        id: 4,
        name: "institution".tr(),
        icon: MdiIcons.townHall,
      );

  factory HousingTypeModel.ngo() => HousingTypeModel(
        id: 5,
        name: "ngo".tr(),
        icon: MdiIcons.humanHandsup,
      );

  factory HousingTypeModel.fromJson(dynamic id) => HousingTypeModel.fromId(
        int.tryParse(id?.toString() ?? "1")!,
      );

  factory HousingTypeModel.fromId(int id) => list.firstWhere(
        (element) => element.id == id,
        orElse: () => HousingTypeModel.host(),
      );

  int toJson() => id;

  @override
  List<Object?> get props => [id, name];

  static List<HousingTypeModel> get list => [
        HousingTypeModel.host(),
        HousingTypeModel.pension(),
        HousingTypeModel.hotel(),
        HousingTypeModel.institution(),
        HousingTypeModel.ngo(),
      ];
}
