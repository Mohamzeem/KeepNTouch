import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';

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

  @override
  Widget build(BuildContext context) {
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
              if (nameController.text == '') {
                CustomLoading.toast('Name is required');
              } else if (nameController.text.length < 8) {
                CustomLoading.toast('Need full name');
              } else {
                AuthData.saveUserData(
                    name: nameController.text, context: context);
                nameController.clear();
              }
            },
            text: 'Save, Complete Registration',
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
              AuthData.signOut(context: context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginView(),
              ));
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
  }
}
