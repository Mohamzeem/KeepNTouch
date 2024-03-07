import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Utils/functions.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_details_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_dialog.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';

class GroupDetailsBody extends GetView<GroupsController> {
  final GroupsRoomModel groupsRoomModel;
  const GroupDetailsBody({super.key, required this.groupsRoomModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          //^ appbar
          CustomDetailsBar(
            photoUrl: groupsRoomModel.isGroupPhoto,
            onTapDots: () {
              AppFunctions.showBtmSheetWithTextAndButton(
                context: context,
                controller: controller.changeGrpController,
                title: 'Change name of the group',
                lable: 'New Name',
                buttonText: 'Save New Name',
                sheetIcon: Icons.close,
                prefixIcon: FluentIcons.chat_multiple_32_filled,
                onPressedbutton: () {},
                onTapSheetIcon: () => Get.back(),
              );
            },
          ),
          SizedBox(height: 20.h),
          //^ grp name
          CustomText(
            text: groupsRoomModel.groupName!,
            fontSize: 25,
            color: AppColors.kBlack,
          ),
          //^ grp number
          CustomText(
            text: 'Group: ${groupsRoomModel.members!.length} Members',
            fontSize: 20,
            color: AppColors.kGrey,
          ),
          //^ divider
          Divider(
            color: AppColors.kGrey,
            height: 20.h,
          ),
          //^ members text
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: 'Members',
              fontSize: 22,
              color: AppColors.kGrey,
            ),
          ),
          SizedBox(height: 15.h),
          //^ item
          Row(
            children: [
              const CustomCachedImage(
                height: 40,
                width: 40,
                photoUrl: AppStrings.defaultAppPhoto,
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 250.w,
                child: CustomText(
                  text: groupsRoomModel.members!.last.toString(),
                  fontSize: 20,
                  color: AppColors.mainColor,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  CustomDialog.twoButtonDialog(
                    context: context,
                    textBody: 'Make (name) Admin',
                    textButton1: 'Yes',
                    textButton2: 'No',
                    onPressed: () {},
                  );
                },
                child: const Icon(FluentIcons.person_12_regular),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  CustomDialog.twoButtonDialog(
                    context: context,
                    textBody: 'Remove (name)',
                    textButton1: 'Yes',
                    textButton2: 'No',
                    onPressed: () {},
                  );
                },
                child: const Icon(FluentIcons.delete_12_regular),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
