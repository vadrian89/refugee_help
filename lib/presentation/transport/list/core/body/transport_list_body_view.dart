import 'package:flutter/material.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_body_table.dart';

import 'transport_list_slidable.dart';
import 'transport_list_tile.dart';

class TransportListBodyView extends ResponsiveWidget {
  final List<TransportModel> list;
  final int page;
  final int? totalRows;

  const TransportListBodyView({
    Key? key,
    required this.list,
    this.page = 1,
    this.totalRows,
  }) : super(key: key);

  @override
  Widget phone(BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => PrivilegedBuilder(
          builder: (context, isPrivileged) => isPrivileged
              ? TransportListSlidable(model: list[index])
              : TransportListTile(model: list[index]),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: list.length,
      );

  @override
  Widget desktop(BuildContext context) => TransportListBodyTable(
        list: list,
        page: page,
        totalRows: totalRows,
      );
}
