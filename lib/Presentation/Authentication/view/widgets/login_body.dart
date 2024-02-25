import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text_button.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Authentication/view_model/auth_cubit/auth_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool showPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _clearCons() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          //  MyApp.navigation.navigateAndFinish(AppRouter.controlView);
          CustomSnackBar.showSuccessSnackBar(
              context: context, message: 'Logged in successfully');
          _clearCons();
        } else if (state is LoginFailureState) {
          CustomSnackBar.showErrorSnackBar(
              context: context, message: state.errMessage);
        } else if (state is RegisterSuccessState) {
          CustomSnackBar.showSuccessSnackBar(
              context: context, message: 'Account Created successfully');
          _clearCons();
        } else if (state is RegisterFailureState) {
          CustomSnackBar.showErrorSnackBar(
              context: context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            children: [
              SizedBox(height: 100.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Wrap(
                    children: [
                      CustomText(
                        text: 'Keep',
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                      CustomText(
                        text: 'N',
                        color: AppColors.kGrey1,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                      CustomText(
                        text: 'Touch',
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/icon-call.png',
                    color: const Color.fromARGB(255, 57, 39, 176),
                    scale: 0.5,
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              const CustomText(
                text: 'Sign In',
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
                fontSize: 28,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                label: 'Email',
                controller: emailController,
                keyBoard: TextInputType.emailAddress,
                prefixIcon: Icons.email_rounded,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                label: 'Password',
                controller: passwordController,
                keyBoard: TextInputType.emailAddress,
                prefixIcon: Icons.lock,
                obscureText: showPassword,
                suffixIconShow: true,
                suffixIconFunction: () =>
                    setState(() => showPassword = !showPassword),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  text: 'Forgot Password',
                  onPressed: () =>
                      MyApp.navigation.navigateTo(AppRouter.forgotPasswordView),
                  color: AppColors.kGrey,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  if (emailController.text == '') {
                    CustomSnackBar.showErrorSnackBar(
                        context: context, message: 'Email is required');
                  } else if (passwordController.text == '') {
                    CustomSnackBar.showErrorSnackBar(
                        context: context, message: 'Password is required');
                  } else {
                    cubit.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                text: 'Sign In',
                width: double.infinity,
                height: 45,
                isLoading: state is LoginLoadingState,
                threeRadius: 5,
                lastRadius: 5,
                fontSize: 25,
                backgroundColor: AppColors.mainColor,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  if (emailController.text == '') {
                    CustomSnackBar.showErrorSnackBar(
                        context: context, message: 'Email is required');
                  } else if (passwordController.text == '') {
                    CustomSnackBar.showErrorSnackBar(
                        context: context, message: 'Password is required');
                  } else {
                    cubit.register(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                text: 'Create Account',
                width: double.infinity,
                height: 45,
                isLoading: state is RegisterloadingState,
                threeRadius: 5,
                lastRadius: 5,
                fontSize: 25,
                backgroundColor: AppColors.kBlack,
                textColor: AppColors.kWhite,
              ),
            ],
          ),
        );
      },
    );
  }
}
