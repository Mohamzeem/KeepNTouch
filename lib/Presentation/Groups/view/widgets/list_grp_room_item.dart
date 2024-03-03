import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_room_view.dart';
import 'package:keep_n_touch/Presentation/Groups/view/group_room_view.dart';

class ListGroupsRoomItem extends StatelessWidget {
  // final RoomModel roomModel;
  const ListGroupsRoomItem({
    super.key,
    // required this.roomModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const GroupsRoomView(),
          ),
        ),
        child: SizedBox(
          height: 60,
          child: Card(
            elevation: 5,
            surfaceTintColor: Colors.transparent,
            color: AppColors.secColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              child: const Row(
                children: [
                  CustomCachedImage(
                    height: 40,
                    width: 40, photoUrl: AppStrings.defaultAppPhoto,
                    // photoUrl: roomModel.contactId ==
                    //         FirebaseAuth.instance.currentUser!.uid
                    //     ? roomModel.isSenderPhoto
                    //     : roomModel.iscontactPhoto,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Sender',
                        // text: roomModel.contactId ==
                        //         FirebaseAuth.instance.currentUser!.uid
                        //     ? roomModel.senderName!
                        //     : roomModel.contactName!,
                        fontSize: 17,
                      ),
                      CustomText(
                        text: 'roomModel.lastMessage!',
                        fontSize: 15,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
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
