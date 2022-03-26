import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeedbackTypeModel extends Equatable {
  final int id;
  final String name;
  final IconData icon;

  const FeedbackTypeModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory FeedbackTypeModel.noProblem() => FeedbackTypeModel(
        id: 1,
        name: "no_remark_feedback".tr(),
        icon: MdiIcons.handOkay,
      );

  factory FeedbackTypeModel.remark() => FeedbackTypeModel(
        id: 2,
        name: "remarks".tr(),
        icon: MdiIcons.information,
      );

  factory FeedbackTypeModel.problem() => FeedbackTypeModel(
        id: 3,
        name: "problem".tr(),
        icon: MdiIcons.alertDecagram,
      );

  factory FeedbackTypeModel.appFeedback() => FeedbackTypeModel(
        id: 4,
        name: "app_feedback".tr(),
        icon: MdiIcons.applicationBraces,
      );

  factory FeedbackTypeModel.fromJson(Map<String, dynamic> json) => FeedbackTypeModel.fromId(
        int.tryParse(json["type"]?.toString() ?? "1")!,
      );

  factory FeedbackTypeModel.fromId(int id) => list.firstWhere((element) => element.id == id);

  Map<String, dynamic> toJson() => {"type": id};

  @override
  List<Object?> get props => [id, name];

  static List<FeedbackTypeModel> get list => [
        FeedbackTypeModel.noProblem(),
        FeedbackTypeModel.remark(),
        FeedbackTypeModel.problem(),
        FeedbackTypeModel.appFeedback(),
      ];
}
