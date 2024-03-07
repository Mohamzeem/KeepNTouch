import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/custom_fioating_btn.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grps_body.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<GroupsController>(
      init: GroupsController(),
      builder: (controller) => Scaffold(
        body: const Groupsbody(),
        floatingActionButton: CustomFloatingButton(
          floatingIcon: FluentIcons.chat_multiple_32_filled,
          controller: controller.grpController,
          title: 'Enter name of new a group',
          lable: 'Group Name',
          buttonText: 'Add Members to Group',
          sheetIcon: Icons.close,
          prefixIcon: FluentIcons.chat_multiple_32_filled,
          onPressedbutton: () => controller.goAddGrpMemebers(),
          onTapSheetIcon: () => Get.back(),
        ),
      ),
    ));
  }
}
