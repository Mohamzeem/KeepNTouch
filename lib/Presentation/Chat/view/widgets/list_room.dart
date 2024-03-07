import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_circular_loading.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Chat/controller/chat_controller.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/list_room_item.dart';

class ListRoom extends StatefulWidget {
  const ListRoom({
    super.key,
  });

  @override
  State<ListRoom> createState() => _ListRoomState();
}

class _ListRoomState extends State<ListRoom> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ChatController().getChatRooms(),
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
          final List<RoomModel> list = snapshot.data!
            ..sort(
              (a, b) => b.lastMessageTime!.compareTo(a.lastMessageTime!),
            );
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final roomModel = list[index];
                  return ListRoomItem(roomModel: roomModel);
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
              ));
        }
      },
    );
  }
}
