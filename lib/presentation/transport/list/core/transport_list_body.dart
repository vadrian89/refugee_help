import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/transport/list/core/transport_list_slidable.dart';

import 'transport_list_consumer.dart';
import 'transport_list_tile.dart';

class TransportListBody extends StatelessWidget {
  const TransportListBody({Key? key}) : super(key: key);

  @override
  Widget build(_) => TransportListConsumer(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const LoaderWidget(),
          view: (list) {
            if (list.isEmpty) {
              return const NoDataPlaceholder();
            }
            return ListView.separated(
              itemBuilder: (context, index) => PrivilegedBuilder(
                builder: (context, isPrivileged) => isPrivileged
                    ? TransportListSlidable(model: list[index])
                    : TransportListTile(model: list[index]),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: list.length,
            );
          },
        ),
      );
}
