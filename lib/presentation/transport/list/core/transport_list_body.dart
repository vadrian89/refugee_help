import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_body_view.dart';

import 'transport_list_consumer.dart';

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
            return TransportListBodyView(list: list);
          },
        ),
      );
}
