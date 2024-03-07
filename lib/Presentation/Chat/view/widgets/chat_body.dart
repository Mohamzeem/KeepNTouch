import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_app_bar.dart';
import 'package:keep_n_touch/Presentation/Authentication/controller/auth_controller.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/list_room.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomAppBar(
            searchLabel: 'Contact Name',
            photoUrl: AuthController().auth.currentUser!.photoURL == null
                ? AppStrings.defaultAppPhoto
                : AuthController().auth.currentUser!.photoURL!,
            title: 'Chats',
            onTap: () {},
          ),
          const ListRoom(),
        ],
      ),
    );
  }
}
