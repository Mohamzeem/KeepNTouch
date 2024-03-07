import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_app_bar.dart';
import 'package:keep_n_touch/Presentation/Authentication/controller/auth_controller.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grps_rooms_list.dart';

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
            searchLabel: 'Group Name',
            photoUrl: AuthController().auth.currentUser!.photoURL == null
                ? AppStrings.defaultAppPhoto
                : AuthController().auth.currentUser!.photoURL!,
            onTap: () {},
            title: 'Groups',
          ),
          const GroupsRoomsList()
        ],
      ),
    );
  }
}
