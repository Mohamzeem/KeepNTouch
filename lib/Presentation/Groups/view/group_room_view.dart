import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/chat_room_body.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/group_room_body.dart';

class GroupsRoomView extends StatelessWidget {
  // final RoomModel roomModel;
  const GroupsRoomView({
    super.key,
    // required this.roomModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GroupsRoomBody(),
      ),
    );
  }
}
