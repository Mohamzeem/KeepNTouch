import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Center(
        child: CustomText(text: 'ContactsView'),
      ),
      Icon(
        FluentIcons.book_contacts_24_filled,
        size: 30,
        color: AppColors.mainColor,
      ),
      Icon(
        FluentIcons.book_contacts_28_filled,
        size: 30,
        color: AppColors.mainColor,
      ),
      Icon(
        FluentIcons.book_contacts_32_filled,
        size: 30,
        color: AppColors.mainColor,
      ),
      Icon(
        FluentIcons.chat_28_regular,
        size: 30,
        color: AppColors.mainColor,
      ),
      Icon(
        FluentIcons.chat_32_regular,
        size: 30,
        color: AppColors.mainColor,
      ),
      Icon(
        FluentIcons.chat_48_regular,
        size: 30,
        color: AppColors.mainColor,
      ),
    ]);
  }
}
