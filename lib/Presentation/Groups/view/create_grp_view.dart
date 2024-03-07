import 'package:flutter/material.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/create_grp_body.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CreateGroupBody(),
      ),
    );
  }
}
