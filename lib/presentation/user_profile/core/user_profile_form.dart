import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/bottom_sheets/image_picker_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/refocus_background.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/core/widgets/editable_profile_image.dart';
import 'package:refugee_help/presentation/user_profile/core/user_button_bar.dart';
import 'package:refugee_help/presentation/user_profile/core/user_profile_listener.dart';

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  State<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  late final TextEditingController _lastNameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _countyController;
  late final TextEditingController _cityController;
  late final TextEditingController _addressController;
  late final TextEditingController _organizationController;
  UserModel? _user;
  ImageModel? _profileImage;

  String get _lastName => _lastNameController.text;
  String get _firstName => _firstNameController.text;
  String get _phone => _phoneController.text;
  String get _email => _emailController.text;
  String get _county => _countyController.text;
  String get _city => _cityController.text;
  String get _address => _addressController.text;
  String get _organization => _organizationController.text;
  bool get _isFilled =>
      _lastName.isNotEmpty &&
      _firstName.isNotEmpty &&
      _phone.isNotEmpty &&
      _email.isNotEmpty &&
      _county.isNotEmpty &&
      _city.isNotEmpty &&
      _address.isNotEmpty;
  bool get _isValid =>
      Validators.isValidPhone(_phone) &&
      Validators.isValidEmail(_email) &&
      (_profileImage?.isValid ?? false);
  bool editable = false;

  UserModel get _updatedUser => _user!.copyWith(
        lastName: _lastName.trim(),
        firstName: _firstName.trim(),
        phone: _phone.trim(),
        county: _county.trim(),
        city: _city.trim(),
        address: _address.trim(),
        profileImage: _profileImage,
        organization: _organization.trim(),
      );

  @override
  void initState() {
    super.initState();
    _user = context.read<AuthenticationCubit>().state.maybeWhen(
          orElse: () => null,
          authenticated: (user) => user,
        );
    _profileImage = _user?.profileImage;
    _lastNameController = TextEditingController(text: _user!.lastName);
    _firstNameController = TextEditingController(text: _user!.firstName);
    _phoneController = TextEditingController(text: _user!.phone);
    _emailController = TextEditingController(text: _user!.email);
    _countyController = TextEditingController(text: _user!.county);
    _cityController = TextEditingController(text: _user!.city);
    _addressController = TextEditingController(text: _user!.address);
    _organizationController = TextEditingController(text: _user!.organization);
  }

  @override
  void dispose() {
    super.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _countyController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _organizationController.dispose();
  }

  @override
  Widget build(_) => UserProfileListener(
        onEdit: (user) => setState(() {
          _user = user;
          _updateUserForm();
        }),
        onView: (user) => setState(() {
          _user = user;
          _updateUserForm();
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

  Widget get _formBuilder => BlocBuilder<UserCubit, UserState>(
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
                image: _profileImage,
                editable: editable,
                onEdit: () => _pickImage(context),
              ),
              const VerticalSpacing(),
              ..._fields,
              const VerticalSpacing(20),
              UserButtonBar(
                onSave: () {
                  if (!_isFilled) {
                    AdaptiveDialog.showError(context, message: "form_not_completed".tr());
                    return;
                  }
                  if (!_isValid) {
                    AdaptiveDialog.showError(context, message: "form_is_not_valid".tr());
                    return;
                  }
                  AdaptiveDialog.showConfirmation(
                    context,
                    title: "update_user_title".tr(),
                    content: "update_user_confirm".tr(),
                    confirmText: "save".tr(),
                    cancelText: "cancel".tr(),
                  ).then(
                      (save) => save ? context.read<UserCubit>().updateUser(_updatedUser) : null);
                },
              ),
              const VerticalSpacing(40),
            ],
          );
        },
        buildWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );

  List<Widget> get _fields => [
        AppTextFormField(
          controller: _lastNameController,
          hintText: "${"last_name".tr()}*",
          autovalidateMode: AutovalidateMode.always,
          validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
          readOnly: !editable,
        ),
        AppTextFormField(
          controller: _firstNameController,
          hintText: "${"first_name".tr()}*",
          autovalidateMode: AutovalidateMode.always,
          validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
          readOnly: !editable,
        ),
        AppTextFormField(
          controller: _phoneController,
          hintText: "${"phone".tr()}*",
          validator: (val) => Validators.isValidPhone(val) ? null : "phone_invalid".tr(),
          keyboardType: TextInputType.phone,
          readOnly: !editable,
        ),
        AppTextFormField(
          controller: _emailController,
          hintText: "E-mail*",
          readOnly: true,
        ),
        AppTextFormField(
          controller: _countyController,
          hintText: "${"county".tr()}*",
          readOnly: !editable,
        ),
        AppTextFormField(
          controller: _cityController,
          hintText: "${"city".tr()}*",
          readOnly: !editable,
        ),
        AppTextFormField(
          controller: _addressController,
          hintText: "${"address".tr()}*",
          readOnly: !editable,
        ),
        AppTextFormField(
          controller: _organizationController,
          hintText: "organization".tr(),
          readOnly: !editable,
        ),
      ];

  Future<void> _pickImage(BuildContext context) async {
    final pickedImage = await ImagePickerBottomSheet().show(context);
    if (pickedImage == null) return;

    setState(() => _profileImage = pickedImage);
  }

  void _updateUserForm() {
    _profileImage = _user!.profileImage;
    _lastNameController.text = _user!.lastName ?? "";
    _firstNameController.text = _user!.firstName ?? "";
    _phoneController.text = _user!.phone ?? "";
    _emailController.text = _user!.email ?? "";
    _countyController.text = _user!.county ?? "";
    _cityController.text = _user!.city ?? "";
    _addressController.text = _user!.address ?? "";
    _organizationController.text = _user!.organization ?? "";
  }
}
