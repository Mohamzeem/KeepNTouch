import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Center(
        child: CustomText(text: 'GroupsView'),
      )
    ]);
  }
}
