import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/core/adaptive_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SocialSignInButton extends AdaptiveWidget {
  final VoidCallback? onPressed;

  const SocialSignInButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => SocialLoginButton(
        buttonType: Theme.of(context).brightness == Brightness.dark
            ? SocialLoginButtonType.apple
            : SocialLoginButtonType.appleBlack,
        text: "sign_in_with_apple".tr(),
        onPressed: onPressed,
      );

  @override
  Widget materialBuild(BuildContext context) => SocialLoginButton(
        buttonType: SocialLoginButtonType.google,
        text: "sign_in_with_google".tr(),
        onPressed: onPressed,
      );
}
