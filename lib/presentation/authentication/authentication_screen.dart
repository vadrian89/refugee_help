import 'package:flutter/material.dart';

import 'package:refugee_help/presentation/authentication/core/authentication_body.dart';
import 'package:refugee_help/presentation/core/widgets/refocus_background.dart';

import 'core/auth_listener.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const ScaffoldMessenger(
        child: RefocusBackground(
          child: Scaffold(
            body: AuthListener(child: AuthenticationBody()),
          ),
        ),
      );
}
