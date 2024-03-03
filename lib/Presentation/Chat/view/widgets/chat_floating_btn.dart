// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/loading.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Chat/data/chat_data.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/contacts_list.dart';
import '../../../../Core/Utils/functions.dart';

class ChatFloatingButton extends StatefulWidget {
  final bool? isGroup;
  const ChatFloatingButton({
    Key? key,
    this.isGroup = false,
  }) : super(key: key);

  @override
  State<ChatFloatingButton> createState() => _ChatFloatingButtonState();
}

class _ChatFloatingButtonState extends State<ChatFloatingButton> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => AppFunctions.showBtmSheet(
        context,
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.isGroup!
                    ? 'Enter name of new a group'
                    : 'Enter email to start new chat',
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
            label: widget.isGroup! ? 'Group Name' : 'Email',
            maxLength: 50,
            controller: controller,
            keyBoard: TextInputType.emailAddress,
            prefixIcon: widget.isGroup!
                ? FluentIcons.chat_multiple_32_filled
                : Icons.email,
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              if (controller.text.isEmpty) {
                CustomLoading.toast(widget.isGroup!
                    ? 'Please enter a group name'
                    : 'Please enter an email');
              } else {
                widget.isGroup!
                    ? null
                    // ? GroupsData.createGroup(
                    //     grpName: controller.text,
                    //     grpMembers: [],
                    //     context: context,
                    //   ).then((value) => Navigator.pop(context))
                    : ChatData.createChatRoom(
                        context: context,
                        email: controller.text.trim(),
                      );
                Navigator.pop(context);
                controller.clear();
              }
            },
            text: widget.isGroup! ? 'Add Members to Group' : 'Create New Chat',
            width: double.infinity,
            height: 45,
            threeRadius: 10,
            lastRadius: 10,
            backgroundColor: AppColors.mainColor,
          ),
          SizedBox(height: Platform.isIOS ? 10.h : 0.h),
        ],
      ),
      backgroundColor: AppColors.secColor,
      child: Icon(
        widget.isGroup!
            ? FluentIcons.chat_multiple_32_filled
            : FluentIcons.chat_20_filled,
        color: AppColors.mainColor,
        size: 50,
      ),
    );
  }
}
