import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({
    super.key,
  });

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          SizedBox(height: 20.h),
          const Center(
            child: CustomText(
              text: 'Forgot Password',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: 150.h),
          const CustomText(
            text: 'Please enter your Email',
            fontSize: 25,
            color: AppColors.mainColor,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            controller: emailController,
            maxLength: 50,
            label: 'Email',
            keyBoard: TextInputType.emailAddress,
            prefixIcon: Icons.email,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              if (emailController.text == '') {
                CustomSnackBar.showErrorSnackBar(
                    context: context, message: 'Please enter email');
              } else if (!emailController.text.contains('@')) {
                CustomSnackBar.showErrorSnackBar(
                    context: context, message: 'Please enter a valid email');
              } else if (emailController.text.contains(' ')) {
                CustomSnackBar.showErrorSnackBar(
                    context: context,
                    message: 'Email should not contain spaces');
              } else {}
            },
            text: 'Send Email',
            width: double.infinity,
            height: 45,
            threeRadius: 5,
            lastRadius: 5,
            fontSize: 25,
            backgroundColor: AppColors.mainColor,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () => Navigator.of(context).pop(),
            text: 'Back',
            width: double.infinity,
            height: 45,
            threeRadius: 5,
            lastRadius: 5,
            fontSize: 25,
            textColor: AppColors.kBlack,
            backgroundColor: AppColors.kGrey,
          ),
        ],
      ),
    );
  }
}
