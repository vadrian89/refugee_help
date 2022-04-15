import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/bottom_sheets/image_picker_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/constrained_form.dart';
import 'package:refugee_help/presentation/core/widgets/image_list_manager_view.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/housing/manage/core/housing_period_dropdown.dart';

import 'manage_housing_listener.dart';
import 'housing_button_bar.dart';
import 'manage_housing_user_info.dart';

class ManageHousingForm extends StatefulWidget {
  const ManageHousingForm({Key? key}) : super(key: key);

  @override
  State<ManageHousingForm> createState() => _ManageHousingFormState();
}

class _ManageHousingFormState extends State<ManageHousingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late HousingModel _housing;
  bool _editable = false;

  List<ImageModel> get _images => List.from(_housing.imageList ?? []);
  List<ImageModel> get _imagesToDelete => List.from(_housing.imagesToDelete ?? []);

  @override
  void initState() {
    super.initState();
    _housing = context.read<ManageHousingCubit>().state.maybeWhen(
          orElse: () => const HousingModel(),
          edit: (housing) => housing,
          view: (housing, _, __) => housing,
        );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(_) => ManageHousingConsumer(
        builder: (context, state) {
          _editable = state.maybeMap(
            orElse: () => false,
            edit: (_) => true,
            view: (view) {
              _housing = view.housing;
              return false;
            },
          );

          return ConstrainedForm(
            formKey: _formKey,
            children: [
              const VerticalSpacing(),
              ImageListManagerView(
                editable: _editable,
                list: _images,
                onAdd: () => _pickImage(context),
                onDelete: _deleteImage,
              ),
              const VerticalSpacing(),
              ..._fields(state),
              HousingButtonBar(
                onCancel: () => (_housing.id != null)
                    ? context.read<ManageHousingCubit>().toggleEdit()
                    : Navigator.maybePop(context),
                onSave: () => _saveForm(context),
              ),
            ],
          );
        },
      );

  List<Widget> _fields(ManageHousingState state) => [
        AppTextFormField(
          initialValue: _housing.address,
          hintText: "${"address".tr()}*",
          validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
          readOnly: !_editable,
          onSaved: (val) => _housing = _housing.copyWith(address: val),
        ),
        AppTextFormField(
          initialValue: _housing.bedsAvailable?.toString(),
          hintText: "${"beds_available".tr()}*",
          validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
          keyboardType: TextInputType.number,
          readOnly: !_editable,
          onSaved: (val) => _housing = _housing.copyWith(bedsAvailable: int.tryParse(val!)),
        ),
        SwitchListTile.adaptive(
          title: Text("${"available".tr()}?"),
          subtitle: Text(_housing.isAvailable! ? "yes".tr() : "no".tr()),
          value: _housing.isAvailable!,
          onChanged: (val) => state.maybeWhen(
            orElse: () => null,
            edit: (_) => setState(() => _housing = _housing.copyWith(
                  isAvailable: val,
                )),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        SwitchListTile.adaptive(
          title: Text("${"offers_transport".tr()}?"),
          subtitle: Text(_housing.hasTransport! ? "yes".tr() : "no".tr()),
          value: _housing.hasTransport!,
          onChanged: (val) => state.maybeWhen(
            orElse: () => null,
            edit: (_) => setState(() => _housing = _housing.copyWith(
                  hasTransport: val,
                )),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        HousingPeriodDropdown(
          value: _housing.period!,
          onChanged: _editable
              ? (value) => setState(() => _housing = _housing.copyWith(
                    period: value,
                  ))
              : null,
        ),
        AppTextFormField(
          initialValue: _housing.remarks,
          hintText: "remarks".tr(),
          readOnly: !_editable,
          maxLines: 5,
          onSaved: (val) => _housing = _housing.copyWith(remarks: val),
        ),
        const ManageHousingUserInfo(),
      ];

  Future<void> _pickImage(BuildContext context) async {
    final pickedImage = await ImagePickerBottomSheet().show(context);
    if (pickedImage == null) return;

    setState(() => _housing = _housing.copyWith(
          imageList: List.from(
            [..._images, pickedImage],
          ),
        ));
  }

  void _deleteImage(ImageModel image) {
    if (!image.isLocal) {
      _housing = _housing.copyWith(
        imagesToDelete: List.from(
          [..._imagesToDelete, image],
        ),
      );
    }
    setState(() {
      _housing = _housing.copyWith(
        imageList: _images.where((element) => element != image).toList(),
      );
    });
  }

  Future<void> _saveForm(BuildContext context) async {
    if (!_housing.imageListIsValid) {
      return await AdaptiveDialog.showError(
        context,
        message: "at_least_one_image_error".tr(),
      );
    }

    if (!(_formKey.currentState?.validate() ?? false)) {
      return await AdaptiveDialog.showError(
        context,
        message: "form_is_not_valid".tr(),
      );
    }

    return AdaptiveDialog.showConfirmation(
      context,
      title: "update_housing_title".tr(),
      content: "update_housing_confirm".tr(),
      confirmText: "save".tr(),
      cancelText: "cancel".tr(),
    ).then((save) {
      _formKey.currentState!.save();
      save ? context.read<ManageHousingCubit>().save(_housing.updated) : null;
    });
  }
}
