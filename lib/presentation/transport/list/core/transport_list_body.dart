import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_body_view.dart';

import 'transport_list_listener.dart';

class TransportListBody extends StatelessWidget {
  final bool enableFilters;

  const TransportListBody({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  Widget build(_) => BlocProvider(
        create: (context) => ListTransportCubit(authCubit: context.read<AuthenticationCubit>()),
        child: TransportListListener(
          child: TransportListBodyView(enableFilters: enableFilters),
        ),
      );
}
