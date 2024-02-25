import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Presentation/Chat/data/chat_api.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_field_row.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_room_bar.dart';

class ChatRoomBody extends StatefulWidget {
  final RoomModel model;
  const ChatRoomBody({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ChatRoomBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatRoomBody> {
  final controller = TextEditingController();
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    final bottomOffset = scrollController.position.minScrollExtent;
    if (scrollController.hasClients) {
      scrollController.animateTo(
        bottomOffset,
        duration: const Duration(microseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void _sendMsg() async {
    if (controller.text.isNotEmpty) {
      ChatApi().sendMessage(
        roomId: widget.model.id!,
        receiverId: widget.model.id!,
        msg: controller.text,
      );
    }
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    //final userModel = BlocProvider.of<AuthCubit>(context).userModel;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          ChatRoomBar(model: widget.model),
          const Spacer(),
          // StreamBuilder(
          //   stream: ChatApi().getMessages(
          //       userId: AppStrings.userId!, receiverId: widget.model.id!),
          //   builder: (context, snapshots) {
          //     if (snapshots.hasError) {
          //       return const CustomText(text: "Error");
          //     } else if (snapshots.connectionState == ConnectionState.waiting) {
          //       return CustomCircularLoading(height: 25.h, width: 25.w);
          //     } else if (!snapshots.hasData) {
          //       return const CustomText(text: 'No Message Available');
          //     } else if (snapshots.hasData) {
          //       return Expanded(
          //         child: ListView.builder(
          //             itemCount: snapshots.data!.length,
          //             controller: scrollController,
          //             reverse: true,
          //             shrinkWrap: true,
          //             itemBuilder: (context, index) {
          //               var item = snapshots.data![index];
          //               DateTime inputTime =
          //                   DateFormat('dd/MM/yyyy, HH:mm:ss aaa')
          //                       .parse(item.createdAt!);

          //               String formattedTime =
          //                   DateFormat('h:mm a').format(inputTime);
          //               if (item.senderId! == AppStrings.userId) {
          //                 return UserMsg(
          //                   msg: item.message!,
          //                   createdAt: formattedTime,
          //                   photoUrl: AppStrings.userPhoto!,
          //                 );
          //               } else {
          //                 return ContactMsg(
          //                   photoUrl: widget.model.photo!,
          //                   msg: item.message!,
          //                   createdAt: formattedTime,
          //                 );
          //               }
          //             }),
          //       );
          //     }
          //     return const CustomText(text: 'No Message Available');
          //   },
          // ),
          SizedBox(height: 15.h),
          ChatFieldRow(
            controller: controller,
            onTap: () {
              _sendMsg();
              // _scrollToBottom();
            },
          ),
        ],
      ),
    );
  }
}
