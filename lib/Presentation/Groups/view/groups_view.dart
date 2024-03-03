import 'package:flutter/material.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/groups_body.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grps_floating_btn.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Groupsbody(),
        floatingActionButton: GroupsFloatingButton(
          isGroup: true,
        ),
      ),
    );
  }
}
