import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class TransportListConsumer extends StatelessWidget {
  final Widget Function(BuildContext context, ListTransportState state) builder;

  const TransportListConsumer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<ListTransportCubit, ListTransportState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          deleting: () => showLoadingSnackBar(context, message: "deleting_transport".tr()),
          success: (message) => showSuccessSnackBar(context, message: message),
          failure: (message) => showErrorSnackBar(context, message: message),
        ),
        listenWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          deleting: () => true,
          success: (_) => true,
          failure: (_) => true,
        ),
        builder: builder,
        buildWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
      );
}
