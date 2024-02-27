import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class ChatRoomBar extends StatelessWidget {
  final RoomModel roomModel;
  const ChatRoomBar({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: AppColors.mainColor,
            ),
          ),
        ),
        CustomText(
          text: roomModel.contactId == FirebaseAuth.instance.currentUser!.uid
              ? roomModel.senderName!
              : roomModel.contactName!,
          fontSize: 25,
          color: AppColors.mainColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: CustomCachedImage(
            height: 45,
            width: 45,
            photoUrl:
                roomModel.contactId == FirebaseAuth.instance.currentUser!.uid
                    ? roomModel.isSenderPhoto
                    : roomModel.iscontactPhoto,
          ),
        )
      ],
    );
  }
}
