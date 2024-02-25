import 'package:flutter/material.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/widgets/forgot_password_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotPasswordBody(),
    );
  }
}
