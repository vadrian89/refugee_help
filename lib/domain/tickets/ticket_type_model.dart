import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_type_model.g.dart';

@JsonSerializable()
class TicketTypeModel extends Equatable {
  final int id;
  final String name;

  String get translatedName => name.tr();
  @override
  List<Object?> get props => [id, name];

  const TicketTypeModel({required this.id, required this.name});

  factory TicketTypeModel.fromJson(Map<String, dynamic> json) => _$TicketTypeModelFromJson(json);

  factory TicketTypeModel.transport() => const TicketTypeModel(id: 1, name: "transport");

  factory TicketTypeModel.housing() => const TicketTypeModel(id: 2, name: "housing");

  factory TicketTypeModel.food() => const TicketTypeModel(id: 3, name: "food");

  Map<String, dynamic> toJson() => _$TicketTypeModelToJson(this);

  static List<TicketTypeModel> values = [
    TicketTypeModel.transport(),
    TicketTypeModel.housing(),
    TicketTypeModel.food(),
  ];

  static bool isValidType(String name) {
    for (final type in values) {
      if (type.name == name) {
        return true;
      }
    }
    return false;
  }
}
