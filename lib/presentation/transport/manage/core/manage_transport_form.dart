import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/infrastructure/extensions.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/image_picker_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/refocus_background.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/core/widgets/editable_profile_image.dart';
import 'package:path/path.dart' as p;
import 'package:refugee_help/presentation/transport/manage/core/manage_transport_user_info.dart';
import 'package:refugee_help/presentation/transport/manage/core/transport_arrival_tile.dart';
import 'package:refugee_help/presentation/transport/manage/core/transport_type_dropdown.dart';

import 'manage_transport_listener.dart';
import 'transport_button_bar.dart';

class ManageTransportForm extends StatefulWidget {
  const ManageTransportForm({Key? key}) : super(key: key);

  @override
  State<ManageTransportForm> createState() => _ManageTransportFormState();
}

class _ManageTransportFormState extends State<ManageTransportForm> {
  late final TextEditingController _regNumController;
  late final TextEditingController _seatsNumController;
  late final TextEditingController _timeAvailableController;
  late final TextEditingController _destinationsController;
  late final TextEditingController _remarksController;
  TransportModel? _model;

  String get _registrationNum => _regNumController.text;
  String get _seatsNum => _seatsNumController.text;
  String get _timeAvailable => _timeAvailableController.text;
  String get _destinations => _destinationsController.text;
  String get _remarks => _remarksController.text;
  bool get _isFilled =>
      _registrationNum.isNotEmpty &&
      _seatsNum.isNotEmpty &&
      (_model!.atLocation! || _timeAvailable.isNotEmpty) &&
      _destinations.isNotEmpty;

  bool editable = false;

  TransportModel get _updatedModel => (_model ?? const TransportModel()).copyWith(
        registrationNumber: _registrationNum.toUpperCase().trim(),
        seatsAvailable: int.tryParse(_seatsNum.trim()),
        timeAvailable: int.tryParse(_timeAvailable.trim()),
        destinations: _destinations.capitalised.trim(),
        remarks: _remarks.capitalised.trim(),
        createdAt: _model?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

  @override
  void initState() {
    super.initState();
    _model = context.read<ManageTransportCubit>().state.maybeWhen(
          orElse: () => const TransportModel(),
          edit: (model) => model,
          view: (model, _, __) => model,
        );
    _regNumController = TextEditingController();
    _seatsNumController = TextEditingController();
    _timeAvailableController = TextEditingController();
    _destinationsController = TextEditingController();
    _remarksController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _regNumController.dispose();
    _seatsNumController.dispose();
    _timeAvailableController.dispose();
    _destinationsController.dispose();
    _remarksController.dispose();
  }

  @override
  Widget build(_) => ManageTransportListener(
        onEdit: (model) => setState(() {
          _model = model;
          _updateForm();
        }),
        onView: (model) => setState(() {
          _model = model;
          _updateForm();
        }),
        child: RefocusBackground(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: _formBuilder,
            ),
          ),
        ),
      );

  Widget get _formBuilder => BlocBuilder<ManageTransportCubit, ManageTransportState>(
        builder: (context, state) {
          final isInitial = state.maybeWhen(orElse: () => false, initial: () => true);
          if (isInitial) {
            return const LoaderWidget();
          }

          editable = state.maybeWhen(orElse: () => false, edit: (_) => true);

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            children: [
              const VerticalSpacing(),
              EditableProfileImage(
                image: _model!.image,
                editable: editable,
                onEdit: () => _pickImage(context),
              ),
              const VerticalSpacing(),
              ..._fields(state),
              const VerticalSpacing(20),
              TransportButtonBar(
                onCancel: () {
                  if (_model?.id != null) {
                    context.read<ManageTransportCubit>().toggleEdit();
                  } else {
                    Navigator.maybePop(context);
                  }
                },
                onSave: () async {
                  if (!_isFilled) {
                    return await AdaptiveDialog.showError(
                      context,
                      message: "form_not_completed".tr(),
                    );
                  }
                  if (!(await _validateForm(context))) {
                    return;
                  }
                  return AdaptiveDialog.showConfirmation(
                    context,
                    title: "update_transport_title".tr(),
                    content: "update_transport_confirm".tr(),
                    confirmText: "save".tr(),
                    cancelText: "cancel".tr(),
                  ).then((save) {
                    save ? context.read<ManageTransportCubit>().save(_updatedModel) : null;
                  });
                },
              ),
              const VerticalSpacing(40),
            ],
          );
        },
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );

  List<Widget> _fields(ManageTransportState state) => [
        AppTextFormField(
          controller: _regNumController,
          hintText: "${"registration_number".tr()}*",
          autovalidateMode: AutovalidateMode.always,
          validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
          readOnly: !editable,
        ),
        TransportTypeDropdown(
          value: _model?.type,
          onChanged: state.maybeWhen(
            orElse: () => null,
            edit: (_) => (val) => setState(() => _model = _model!.copyWith(type: val)),
          ),
        ),
        AppTextFormField(
          controller: _seatsNumController,
          hintText: "${"seats_available".tr()}*",
          autovalidateMode: AutovalidateMode.always,
          validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
          keyboardType: TextInputType.number,
          readOnly: !editable,
        ),
        TransportArrival(
          textController: _timeAvailableController,
          atLocation: _model!.atLocation!,
          onAtLocationChanged: (val) => state.maybeWhen(
            orElse: () => null,
            edit: (_) => setState(() => _model = _model!.copyWith(atLocation: val)),
          ),
          readOnly: !editable,
        ),
        SwitchListTile.adaptive(
          title: Text("${"available".tr()}?"),
          subtitle: Text(_model!.isAvailable! ? "yes".tr() : "no".tr()),
          value: _model!.isAvailable!,
          onChanged: (val) => state.maybeWhen(
            orElse: () => null,
            edit: (_) => setState(() => _model = _model!.copyWith(
                  isAvailable: val,
                )),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        AppTextFormField(
          controller: _destinationsController,
          hintText: "${"destinations_list".tr()}*",
          autovalidateMode: AutovalidateMode.always,
          validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
          readOnly: !editable,
          maxLines: 3,
        ),
        AppTextFormField(
          controller: _remarksController,
          hintText: "remarks".tr(),
          readOnly: !editable,
          maxLines: 5,
        ),
        const ManageTransportUserInfo(),
      ];

  Future<bool> _validateForm(BuildContext context) async {
    String? error;
    if (!_updatedModel.imageIsValid) {
      error = "no_image_selected_error".tr();
    } else if (!_updatedModel.regNumberIsValid || !_updatedModel.destinationsIsValid) {
      error = "field_empty_error".tr();
    } else if (!_updatedModel.seatsAvailableIsValid) {
      error = "no_available_seats_error".tr();
    } else if (!_updatedModel.typeIsValid) {
      error = "no_type_selected_error".tr();
    } else if (!_updatedModel.timeAvailableIsValid) {
      error = "time_available_invalid_error".tr();
    }
    if (error != null) {
      await AdaptiveDialog.showNotification(context, title: "error".tr(), content: error);
      return false;
    }
    return true;
  }

  Future<void> _pickImage(BuildContext context) async {
    if (kIsWeb) {
      await _selectImageWeb(context);
      return;
    }
    await _selectImageMobile(context);
  }

  Future<void> _selectImageMobile(BuildContext context) async {
    final pickedFile = await ImagePickerBottomSheet().show(context);
    if (pickedFile == null) return;

    final imageBytes = await pickedFile.readAsBytes();
    setState(() => _model = _model!.copyWith(
          image: ImageModel(
            imageData: imageBytes,
            fileExtension: p.extension(pickedFile.path),
          ),
        ));
  }

  Future<void> _selectImageWeb(BuildContext context) async {
    final pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile == null) return;

    final selected = pickedFile.files.single;
    setState(() => _model = _model!.copyWith(
          image: ImageModel(
            imageData: selected.bytes,
            fileExtension: selected.extension,
          ),
        ));
  }

  void _updateForm() {
    _regNumController.text = _model?.registrationNumber ?? "";
    _seatsNumController.text = _model?.seatsAvailable?.toString() ?? "";
    _timeAvailableController.text = _model?.timeAvailable?.toString() ?? "";
    _destinationsController.text = _model?.destinations ?? "";
    _remarksController.text = _model?.remarks ?? "";
  }
}
