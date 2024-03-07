import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grp_details_body.dart';

class GroupDetailsView extends StatelessWidget {
  final GroupsRoomModel groupsRoomModel;

  const GroupDetailsView({super.key, required this.groupsRoomModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GroupDetailsBody(groupsRoomModel: groupsRoomModel),
      ),
    );
  }
}
