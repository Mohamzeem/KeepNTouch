import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Chat/controller/chat_controller.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_field_row.dart';
import 'package:keep_n_touch/Core/Widgets/custom_room_bar.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/contact_msg.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/user_msg.dart';

class ChatRoomBody extends StatefulWidget {
  final RoomModel roomModel;
  const ChatRoomBody({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  State<ChatRoomBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatRoomBody> {
  final controller = TextEditingController();
  final scrollController = ScrollController();

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

  void _sayHello() async {
    ChatController().sendMessage(
      roomId: widget.roomModel.id!,
      contactId:
          FirebaseAuth.instance.currentUser!.uid == widget.roomModel.contactId!
              ? widget.roomModel.senderId!
              : widget.roomModel.contactId!,
      contactName:
          FirebaseAuth.instance.currentUser!.uid == widget.roomModel.contactId!
              ? widget.roomModel.senderName!
              : widget.roomModel.contactName!,
      msg: 'Hello 👋',
    );
  }

  void _sendMsg() async {
    if (controller.text.isNotEmpty) {
      await ChatController().sendMessage(
        roomId: widget.roomModel.id!,
        contactId: FirebaseAuth.instance.currentUser!.uid ==
                widget.roomModel.contactId!
            ? widget.roomModel.senderId!
            : widget.roomModel.contactId!,
        contactName: FirebaseAuth.instance.currentUser!.uid ==
                widget.roomModel.contactId!
            ? widget.roomModel.senderName!
            : widget.roomModel.contactName!,
        msg: controller.text,
      );
    }
    controller.clear();
  }

  void _sendImage() {
    ChatController().sendImage(
      roomId: widget.roomModel.id!,
      contactId:
          FirebaseAuth.instance.currentUser!.uid == widget.roomModel.contactId!
              ? widget.roomModel.senderId!
              : widget.roomModel.contactId!,
      contactName:
          FirebaseAuth.instance.currentUser!.uid == widget.roomModel.contactId!
              ? widget.roomModel.senderName!
              : widget.roomModel.contactName!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRoomBar(
            onTap: () {},
            names: 'sds',
            photoUrl: widget.roomModel.contactId ==
                    FirebaseAuth.instance.currentUser!.uid
                ? widget.roomModel.isSenderPhoto
                : widget.roomModel.iscontactPhoto,
            title: widget.roomModel.contactId ==
                    FirebaseAuth.instance.currentUser!.uid
                ? widget.roomModel.senderName!
                : widget.roomModel.contactName!,
          ),
          SizedBox(height: 15.h),
          StreamBuilder(
            stream: ChatController().getMessages(roomId: widget.roomModel.id!),
            builder: (context, snapshots) {
              if (snapshots.hasError) {
                return const Expanded(
                  child: Center(
                    child: CustomText(
                      text: "Error, please relog in",
                      color: AppColors.mainColor,
                      fontSize: 25,
                    ),
                  ),
                );
              } else if (!snapshots.hasData) {
                return const Expanded(
                  child: Center(
                    child: CustomText(
                      text: 'No Message Available!!',
                      fontSize: 25,
                      color: AppColors.mainColor,
                    ),
                  ),
                );
              } else if (snapshots.hasData) {
                final msgList = snapshots.data!;
                return msgList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: msgList.length,
                            controller: scrollController,
                            reverse: true,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final msgModel = snapshots.data![index];
                              //^check msg read
                              if (msgModel.contactId ==
                                  FirebaseAuth.instance.currentUser!.uid) {
                                ChatController().isReadMessage(
                                    roomId: widget.roomModel.id!,
                                    msgId: msgModel.id!);
                              }
                              DateTime inputTime =
                                  DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(msgModel.createdAt!));
                              String formattedTime =
                                  DateFormat('h:mm a').format(inputTime);
                              final bool isUser = widget.roomModel.contactId ==
                                  FirebaseAuth.instance.currentUser!.uid;
                              //^check if user is sender
                              if (msgModel.senderId! ==
                                  FirebaseAuth.instance.currentUser!.uid) {
                                return UserMsg(
                                  isUser: false,
                                  isRead: msgModel.isRead!,
                                  msg: msgModel.message!,
                                  isText: msgModel.isText!,
                                  createdAt: formattedTime,
                                  photoUrl: isUser
                                      ? widget.roomModel.iscontactPhoto
                                      : widget.roomModel.isSenderPhoto,
                                );
                              } else {
                                return ContactMsg(
                                  isUser: true,
                                  isRead: msgModel.isRead!,
                                  isText: msgModel.isText!,
                                  photoUrl: isUser
                                      ? widget.roomModel.isSenderPhoto
                                      : widget.roomModel.iscontactPhoto,
                                  msg: msgModel.message!,
                                  createdAt: formattedTime,
                                );
                              }
                            }))
                    : Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () => _sayHello(),
                            child: Card(
                              color: AppColors.secColor,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CustomText(
                                  text: 'Say Hello 👋',
                                  fontSize: 25,
                                  color: AppColors.kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              } else {
                return const Expanded(
                  child: Center(
                    child: CustomText(
                      text: 'No Message Available!!',
                      fontSize: 25,
                      color: AppColors.mainColor,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 15.h),
          ChatFieldRow(
            controller: controller,
            sendMsg: () {
              _sendMsg();
              _scrollToBottom();
            },
            sendImage: () {
              _sendImage();
            },
          ),
        ],
      ),
    );
  }
}
