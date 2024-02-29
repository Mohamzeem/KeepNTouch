import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Presentation/Authentication/data/auth_data.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_view.dart';
import 'package:keep_n_touch/Presentation/Contacts/contacts_view.dart';
import 'package:keep_n_touch/Presentation/Groups/groups_view.dart';
import 'package:keep_n_touch/Presentation/Settings/view/settings_view.dart';

class ControlView extends StatefulWidget {
  const ControlView({super.key});

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  @override
  void initState() {
    super.initState();
    AuthData.getProfile();
    AuthData.checkInternet(context);
  }

  List<Widget> icons = const [
    Icon(
      FluentIcons.chat_32_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      FluentIcons.chat_multiple_32_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      FluentIcons.book_contacts_32_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      FluentIcons.settings_24_regular,
      color: AppColors.mainColor,
      size: 27,
    ),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.secColor,
        child: Scaffold(
          extendBody: true,
          // appBar: AppBar(
          //   title: const CustomText(
          //     text: 'Control View',
          //     fontSize: 25,
          //     color: AppColors.mainColor,
          //   ),
          //   actions: [
          //     IconButton(
          //       onPressed: () async {
          //         cubit.logOut();
          //         MyApp.navigation.navigateAndFinish(AppRouter.loginView);
          //       },
          //       icon: const Icon(
          //         Icons.logout,
          //         color: AppColors.mainColor,
          //       ),
          //     ),
          //   ],
          // ),
          body: _getSelectedWidget(index: index),
          bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: AppColors.secColor,
              animationDuration: const Duration(milliseconds: 300),
              height: Platform.isAndroid ? 55 : 42,
              buttonBackgroundColor: AppColors.kCard,
              index: index,
              onTap: (value) => setState(() => index = value),
              items: icons),
        ),
      ),
    );
  }
}

Widget _getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const ChatView();
      break;
    case 1:
      widget = const GroupsView();
      break;
    case 2:
      widget = const ContactsView();
      break;
    case 3:
      widget = const SettingsView();
      break;
    default:
      widget = const ChatView();
      break;
  }
  return widget;
}
