import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text_button.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Authentication/controller/auth_controller.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/forgot_password_view.dart';

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
                    color: AppColors.kGrey,
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
                'assets/images/chat.png',
                color: AppColors.mainColor,
                scale: 1.7,
              ),
            ],
          ),
          SizedBox(height: 80.h),
          const CustomText(
            text: 'Welcome,',
            color: AppColors.mainColor,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          const CustomText(
            text: 'Sign in if you have account or create a new account.',
            color: AppColors.mainColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordView(),
                ),
              ),
              color: AppColors.kGrey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              if (emailController.text == '') {
                CustomLoading.toast(
                    text: 'Email is required',
                    toastPosition: EasyLoadingToastPosition.center);
              } else if (passwordController.text == '') {
                CustomLoading.toast(
                    text: 'Password is required',
                    toastPosition: EasyLoadingToastPosition.center);
              } else {
                AuthController().logIn(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context,
                );
                _clearCons();
              }
            },
            text: 'Sign In',
            width: double.infinity,
            height: 45,
            threeRadius: 5,
            lastRadius: 5,
            fontSize: 25,
            backgroundColor: AppColors.mainColor,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              CustomLoading.show();
              if (emailController.text == '') {
                CustomLoading.toast(
                    text: 'Email is required',
                    toastPosition: EasyLoadingToastPosition.center);
              } else if (passwordController.text == '') {
                CustomLoading.toast(
                    text: 'Password is required',
                    toastPosition: EasyLoadingToastPosition.center);
              } else {
                AuthController().register(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context);
                _clearCons();
              }
            },
            text: 'Create Account',
            width: double.infinity,
            height: 45,
            threeRadius: 5,
            lastRadius: 5,
            fontSize: 25,
            backgroundColor: AppColors.kBlack,
            textColor: AppColors.kWhite,
          ),
        ],
      ),
    );
  }
}
