import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Chat/data/chat_data.dart';

class ChatBar extends StatefulWidget {
  const ChatBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: CustomCachedImage(
              height: 45,
              width: 45,
              photoUrl: AuthData.auth.currentUser!.photoURL == null
                  ? AppStrings.defaultAppPhoto
                  : AuthData.auth.currentUser!.photoURL!),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: CustomText(
            text: AuthData.auth.currentUser!.displayName!,
            fontSize: 25,
            color: AppColors.mainColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Card(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: 'Enter email to start new chat',
                                color: AppColors.mainColor,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.qr_code_scanner_sharp,
                                  color: AppColors.mainColor,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            label: 'Email',
                            maxLength: 50,
                            controller: emailController,
                            keyBoard: TextInputType.emailAddress,
                            prefixIcon: Icons.email,
                          ),
                          SizedBox(height: 10.h),
                          CustomButton(
                            onPressed: () {
                              if (emailController.text.isEmpty) {
                                CustomLoading.toast(
                                    'Please enter a valid email');
                              } else {
                                ChatData.createChatRoom(
                                  context: context,
                                  email: emailController.text.trim(),
                                );
                                Navigator.pop(context);
                                emailController.clear();
                              }
                            },
                            text: 'Create New Chat',
                            width: double.infinity,
                            height: 45,
                            threeRadius: 10,
                            lastRadius: 10,
                            backgroundColor: AppColors.mainColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.chat_outlined,
              color: AppColors.mainColor,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
