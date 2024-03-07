import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Core/Widgets/custom_room_bar.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_field_row.dart';

class GroupsRoomBody extends StatefulWidget {
  final GroupsRoomModel groupsRoomModel;
  const GroupsRoomBody({
    Key? key,
    required this.groupsRoomModel,
  }) : super(key: key);

  @override
  State<GroupsRoomBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<GroupsRoomBody> {
  final controller = TextEditingController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRoomBar(
            isGroup: true,
            onTap: () => Get.toNamed(AppRoute.groupDetailsView,
                arguments: widget.groupsRoomModel),
            names: widget.groupsRoomModel.members.toString(),
            title: widget.groupsRoomModel.groupName!,
            photoUrl: widget.groupsRoomModel.isGroupPhoto,
          ),
          const Spacer(),
          // SizedBox(height: 15.h),
          ChatFieldRow(
            controller: controller,
            sendMsg: () {
              // _sendMsg();
              // _scrollToBottom();
            },
            sendImage: () {
              // _sendImage();
            },
          ),
        ],
      ),
    );
  }
}
