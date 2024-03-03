import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Widgets/custom_app_bar.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/list_grp_room_item.dart';

class Groupsbody extends StatelessWidget {
  const Groupsbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomAppBar(
            onTap: () {},
            title: 'Groups',
          ),
          SizedBox(height: 20.h),
          const ListGroupsRoomItem()
          // Row(
          //   children: [
          //     CircleAvatar(
          //       radius: 25,
          //       backgroundColor: AppColors.secColor,
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20.h),
          // const ContactsList()
        ],
      ),
    );
  }
}
