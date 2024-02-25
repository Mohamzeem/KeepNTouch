import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Authentication/view_model/auth_cubit/auth_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(children: [
        const Center(child: CustomText(text: 'SettingsView')),
        SizedBox(height: 100.h),
        Center(child: CustomText(text: FirebaseAuth.instance.currentUser!.uid)),
        Center(
            child: CustomText(
                text: FirebaseAuth.instance.currentUser!.displayName!)),
        Center(
            child: CustomText(text: FirebaseAuth.instance.currentUser!.email!)),
        SizedBox(height: 20.h),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              MyApp.navigation.navigateAndFinish(AppRouter.loginView);
              CustomSnackBar.showSuccessSnackBar(
                  context: context, message: 'Logged out successfully');
            } else if (state is LoginFailureState) {
              CustomSnackBar.showErrorSnackBar(
                  context: context, message: state.errMessage);
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);
            return CustomButton(
              onPressed: () => cubit.logOut(),
              text: 'Sign Out',
              width: 90,
              height: 45,
              threeRadius: 20,
              lastRadius: 0,
              isLoading: state is LogOutLoadingState,
            );
          },
        ),
      ]),
    );
  }
}
