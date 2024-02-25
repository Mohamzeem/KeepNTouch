import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Center(
        child: CustomText(text: 'ContactsView'),
      )
    ]);
  }
}
