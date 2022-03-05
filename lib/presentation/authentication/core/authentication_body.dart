import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';

import 'package:refugee_help/presentation/authentication/core/sign_in_form.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub1_text.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';

import 'buttons/auth_social_button.dart';
import 'buttons/message_button.dart';

class AuthenticationBody extends StatelessWidget {
  const AuthenticationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 36),
            children: [
              const Center(
                child: FlutterLogo(size: 80),
              ),
              const SignInForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Sub1Text(text: "or".tr(), textAlign: TextAlign.center),
                ],
              ),
              const VerticalSpacing(40),
              SocialSignInButton(
                onPressed: context.read<AuthenticationCubit>().signInWithGoogle,
              ),
              const VerticalSpacing(40),
              MessageButton(
                message: "no_account_q".tr(),
                buttonLabel: "sign_up".tr(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
