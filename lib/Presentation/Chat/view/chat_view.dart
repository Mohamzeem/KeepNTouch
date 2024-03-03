import 'package:flutter/material.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_floating_btn.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ChatBody(),
        floatingActionButton: ChatFloatingButton(),
      ),
    );
  }
}
