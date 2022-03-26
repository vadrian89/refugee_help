import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class ManageTransportListener extends StatelessWidget {
  final Widget child;
  final void Function(TransportModel transport) onView;
  final void Function(TransportModel transport) onEdit;

  const ManageTransportListener({
    Key? key,
    required this.child,
    required this.onView,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<ManageTransportCubit, ManageTransportState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          loading: (message) => showLoadingSnackBar(context, message: message),
          success: (message, popScreen) => (message != null && !popScreen)
              ? showSuccessSnackBar(context, message: message)
              : Navigator.maybePop(context),
          failure: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            return AdaptiveDialog.showError(context, message: message);
          },
          view: (transport, _, __) => onView(transport),
          edit: onEdit,
        ),
        child: child,
      );
}
