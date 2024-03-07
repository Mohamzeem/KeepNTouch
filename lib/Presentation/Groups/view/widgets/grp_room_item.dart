import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';

class GroupsRoomItem extends StatelessWidget {
  final GroupsRoomModel groupsRoomModel;
  const GroupsRoomItem({
    super.key,
    required this.groupsRoomModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () =>
            Get.toNamed(AppRoute.groupsRoomView, arguments: groupsRoomModel),
        child: SizedBox(
          height: 65,
          child: Card(
            elevation: 5,
            surfaceTintColor: Colors.transparent,
            color: AppColors.secColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              child: Row(
                children: [
                  CustomCachedImage(
                    height: 40,
                    width: 40,
                    photoUrl: groupsRoomModel.isGroupPhoto,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: groupsRoomModel.groupName!,
                        fontSize: 17,
                      ),
                      CustomText(
                        text: groupsRoomModel.lastMessageSender!,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.mainColor,
                    child: CustomText(
                      text: '4',
                      color: AppColors.kWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
