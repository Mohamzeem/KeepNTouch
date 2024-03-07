import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Presentation/Authentication/controller/auth_controller.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/complete_register_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
import 'package:keep_n_touch/Presentation/Home/view/home_view.dart';

class AuthPageView extends StatelessWidget {
  const AuthPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: AuthController().userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (FirebaseAuth.instance.currentUser!.displayName == "" ||
                FirebaseAuth.instance.currentUser!.displayName == null ||
                FirebaseAuth.instance.currentUser!.displayName!.isEmpty) {
              return const CompleteRegisterView();
            } else {
              return const HomeView();
            }
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
