import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/prints_service.dart';
import 'package:keep_n_touch/Presentation/Authentication/view_model/auth_cubit/auth_cubit.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_view.dart';
import 'package:keep_n_touch/Presentation/Contacts/contacts_view.dart';
import 'package:keep_n_touch/Presentation/Groups/groups_view.dart';
import 'package:keep_n_touch/Presentation/Settings/settings_view.dart';

class ControlView extends StatefulWidget {
  const ControlView({super.key});

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).getProfile();
    Prints.success(endPoint: '', message: 'Getting profile');
    BlocProvider.of<AuthCubit>(context).checkInternet(context);
  }

  List<Widget> icons = const [
    Icon(
      Icons.chat,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      Icons.group,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      Icons.person,
      color: AppColors.mainColor,
      size: 27,
    ),
    Icon(
      Icons.settings,
      color: AppColors.mainColor,
      size: 27,
    ),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: getSelectedWidget(index: index),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: AppColors.kCard,
          animationDuration: const Duration(milliseconds: 300),
          height: 55,
          buttonBackgroundColor: AppColors.kCard,
          index: index,
          onTap: (value) => setState(() => index = value),
          items: icons),
    );
  }
}

Widget getSelectedWidget({required int index}) {
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
