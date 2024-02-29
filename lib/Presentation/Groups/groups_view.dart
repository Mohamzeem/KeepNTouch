import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Widgets/custom_floating_btn.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/groups_body.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Groupsbody(),
        floatingActionButton: CustomFloatingButton(
          iconData: FluentIcons.chat_multiple_32_filled,
          title: 'Enter name of new group',
          label: 'Group Name',
          validator: 'Please enter name',
          button: 'Create New Group',
        ),
      ),
    );
  }
}
