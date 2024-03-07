import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grp_room_body.dart';

class GroupsRoomView extends StatelessWidget {
  final GroupsRoomModel groupsRoomModel;
  const GroupsRoomView({
    super.key,
    required this.groupsRoomModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GroupsRoomBody(groupsRoomModel: groupsRoomModel),
      ),
    );
  }
}
