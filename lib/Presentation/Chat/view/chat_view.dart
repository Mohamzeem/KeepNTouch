import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Presentation/Chat/controller/chat_controller.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/custom_fioating_btn.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) => Scaffold(
          body: const ChatBody(),
          floatingActionButton: CustomFloatingButton(
            floatingIcon: FluentIcons.chat_20_filled,
            onPressedbutton: () => controller.createRoomFunction(context),
            controller: controller.chatController,
            title: 'Enter email to start new chat',
            lable: 'Email',
            buttonText: 'Create New Chat',
            sheetIcon: Icons.qr_code_scanner_sharp,
            prefixIcon: Icons.email,
            onTapSheetIcon: () {},
          ),
        ),
      ),
    );
  }
}
