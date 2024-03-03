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

class GroupsFloatingButton extends StatefulWidget {
  final bool? isGroup;
  const GroupsFloatingButton({
    Key? key,
    this.isGroup = false,
  }) : super(key: key);

  @override
  State<GroupsFloatingButton> createState() => _GroupsFloatingButtonState();
}

class _GroupsFloatingButtonState extends State<GroupsFloatingButton> {
  final controller = TextEditingController();
  bool? isChecked;
  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
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
                      if (isChecked!) ...[
                        const Row(
                          children: [
                            Column(
                              children: [
                                Divider(thickness: 2, color: AppColors.kGrey),
                                CircleAvatar(backgroundColor: AppColors.kGreen),
                                Divider(thickness: 2, color: AppColors.kGrey),
                              ],
                            )
                          ],
                        ),
                      ],
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
                      ContactsList(isChecked: isChecked!),
                      CustomButton(
                        onPressed: () {
                          print('new value = $isChecked');
                          // if (controller.text.isEmpty) {
                          //   CustomLoading.toast(widget.isGroup!
                          //       ? 'Please enter a group name'
                          //       : 'Please enter an email');
                          // } else {
                          //   widget.isGroup!
                          //       ? null
                          //       // ? GroupsData.createGroup(
                          //       //     grpName: controller.text,
                          //       //     grpMembers: [],
                          //       //     context: context,
                          //       //   ).then((value) => Navigator.pop(context))
                          //       : ChatData.createChatRoom(
                          //           context: context,
                          //           email: controller.text.trim(),
                          //         );
                          //   Navigator.pop(context);
                          //   controller.clear();
                          // }
                        },
                        text: widget.isGroup!
                            ? 'Add Members to Group'
                            : 'Create New Chat',
                        width: double.infinity,
                        height: 45,
                        threeRadius: 10,
                        lastRadius: 10,
                        backgroundColor: AppColors.mainColor,
                      ),
                      SizedBox(height: Platform.isIOS ? 10.h : 0.h),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      // onPressed: () => AppFunctions.showBtmSheet(
      //   context,
      // [
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       CustomText(
      //         text: widget.isGroup!
      //             ? 'Enter name of new a group'
      //             : 'Enter email to start new chat',
      //         color: AppColors.mainColor,
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: const Icon(
      //           Icons.qr_code_scanner_sharp,
      //           color: AppColors.mainColor,
      //           size: 30,
      //         ),
      //       )
      //     ],
      //   ),
      //   SizedBox(height: 10.h),
      //   CustomTextFormField(
      //     label: widget.isGroup! ? 'Group Name' : 'Email',
      //     maxLength: 50,
      //     controller: controller,
      //     keyBoard: TextInputType.emailAddress,
      //     prefixIcon: widget.isGroup!
      //         ? FluentIcons.chat_multiple_32_filled
      //         : Icons.email,
      //   ),
      //   SizedBox(height: 10.h),
      //   if (widget.isGroup == true) ...[
      //     // const ContactsList(),
      //     CustomTextFormField(
      //       label: widget.isGroup! ? 'Group Name' : 'Email',
      //       maxLength: 50,
      //       controller: controller,
      //       keyBoard: TextInputType.emailAddress,
      //       prefixIcon: widget.isGroup!
      //           ? FluentIcons.chat_multiple_32_filled
      //           : Icons.email,
      //     ),
      //   ],
      //   CustomButton(
      //     onPressed: () {
      //       if (controller.text.isEmpty) {
      //         CustomLoading.toast(widget.isGroup!
      //             ? 'Please enter a group name'
      //             : 'Please enter an email');
      //       } else {
      //         widget.isGroup!
      //             ? null
      //             // ? GroupsData.createGroup(
      //             //     grpName: controller.text,
      //             //     grpMembers: [],
      //             //     context: context,
      //             //   ).then((value) => Navigator.pop(context))
      //             : ChatData.createChatRoom(
      //                 context: context,
      //                 email: controller.text.trim(),
      //               );
      //         Navigator.pop(context);
      //         controller.clear();
      //       }
      //     },
      //     text: widget.isGroup! ? 'Add Members to Group' : 'Create New Chat',
      //     width: double.infinity,
      //     height: 45,
      //     threeRadius: 10,
      //     lastRadius: 10,
      //     backgroundColor: AppColors.mainColor,
      //   ),
      //   SizedBox(height: Platform.isIOS ? 10.h : 0.h),
      // ],
      // ),
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
