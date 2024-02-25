import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Authentication/view_model/auth_cubit/auth_cubit.dart';

class CompleteRegisterBody extends StatefulWidget {
  const CompleteRegisterBody({
    super.key,
  });

  @override
  State<CompleteRegisterBody> createState() => _CompleteRegisterBodyState();
}

class _CompleteRegisterBodyState extends State<CompleteRegisterBody> {
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  final nameController = TextEditingController();

  void _clearCons() {
    if (nameController.text == '') {
      CustomSnackBar.showErrorSnackBar(
          context: context, message: 'Name is required');
    } else {
      nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AccountSuccessState) {
          MyApp.navigation.navigateAndFinish(AppRouter.loginView);
          BlocProvider.of<AuthCubit>(context).logOut();
          CustomSnackBar.showSuccessSnackBar(
              context: context, message: 'Account created successfully');
        } else if (state is AccountFailureState) {
          CustomSnackBar.showErrorSnackBar(
              context: context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
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
                text: 'Welcome, Please enter your Name',
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                label: 'User Name',
                maxLength: 50,
                controller: nameController,
                keyBoard: TextInputType.name,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  cubit.saveUserData(name: nameController.text.trim());
                  _clearCons();
                },
                text: 'Save, Complete Registration',
                width: double.infinity,
                height: 45,
                threeRadius: 5,
                lastRadius: 5,
                fontSize: 25,
                backgroundColor: AppColors.mainColor,
                isLoading: state is AccountloadingState,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  cubit.logOut();
                  MyApp.navigation.navigateTo(AppRouter.loginView);
                },
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
      },
    );
  }
}
