import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_room_body.dart';

class ChatRoomView extends StatelessWidget {
  final RoomModel roomModel;
  const ChatRoomView({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ChatRoomBody(model: roomModel),
        ),
      ),
    );
  }
}
