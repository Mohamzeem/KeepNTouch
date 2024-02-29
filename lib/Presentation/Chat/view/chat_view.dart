import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Widgets/custom_floating_btn.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ChatBody(),
        floatingActionButton: CustomFloatingButton(
            iconData: FluentIcons.chat_20_filled,
            title: 'Enter email to start new chat',
            label: 'Email',
            validator: 'Please enter an email',
            button: 'Create New Chat'),
      ),
    );
  }
}
