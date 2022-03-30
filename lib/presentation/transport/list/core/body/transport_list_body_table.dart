import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

class TransportListBodyTable extends StatelessWidget {
  final List<TransportModel> list;

  const TransportListBodyTable({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) => DataListTable(
        columns: _tableColumns,
        rows: List.generate(
          list.length,
          (index) => DataRow(
            cells: [
              _cell(value: list[index].seatsAvailable.toString()),
              _cell(value: list[index].registrationNumber.toString()),
              _cell(value: list[index].type?.name),
              _cell(value: list[index].atLocation! ? "yes".tr() : "no".tr()),
              _cell(value: list[index].isAvailable! ? "yes".tr() : "no".tr()),
              _cell(value: list[index].destinations),
              _cell(value: list[index].user?.fullName),
              _cell(value: list[index].user?.phone),
            ],
            onSelectChanged: (_) => context.read<RootRouterCubit>().goToTransport(
                  id: list[index].id,
                ),
          ),
        ),
      );

  List<DataColumn> get _tableColumns => [
        DataColumn(
            label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Text("seats_available".tr())),
          ],
        )),
        DataColumn(label: Text("registration_number".tr())),
        DataColumn(label: Text("transport_type".tr())),
        DataColumn(label: Text("at_location".tr())),
        DataColumn(label: Text("available".tr())),
        DataColumn(label: Text("destinations_list".tr())),
        DataColumn(label: Text("owner".tr())),
        DataColumn(label: Text("phone".tr())),
      ];

  DataCell _cell({String? value}) => DataCell(Text(value ?? "n/a"));
}
