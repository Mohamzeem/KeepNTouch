import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_circular_loading.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grp_room_item.dart';

class GroupsRoomsList extends StatelessWidget {
  const GroupsRoomsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      builder: (controller) => StreamBuilder(
        stream: controller.getGroupRooms(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: const CustomText(text: "Error Found, restart Application"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: CustomCircularLoading(height: 25.h, width: 25.w),
            );
          } else if (!snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: const CustomText(text: 'No Chats Found'),
            );
          } else if (snapshot.hasData) {
            //^ sort list of chats by last msg time
            final List<GroupsRoomModel> list = snapshot.data!
              ..sort(
                (a, b) => b.lastMessageSender!.compareTo(a.lastMessageSender!),
              );
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final groupsRoomModel = list[index];
                    return GroupsRoomItem(groupsRoomModel: groupsRoomModel);
                  },
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: 350.h),
              child: const CustomText(
                text: 'No Chats Available',
                color: AppColors.mainColor,
                fontSize: 25,
              ),
            );
          }
        },
      ),
    );
  }
}
