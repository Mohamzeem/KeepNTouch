import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_view.dart';
import 'package:keep_n_touch/Presentation/Contacts/contacts_view.dart';
import 'package:keep_n_touch/Presentation/Groups/view/groups_view.dart';
import 'package:keep_n_touch/Presentation/Home/controller/home_states.dart';
import 'package:keep_n_touch/Presentation/Settings/view/settings_view.dart';

class HomeController extends GetxController {
  final states = HomeStates();

  int get index => states.index;
  set index(int value) {
    states.index = value;
    update();
  }

  Widget getSelectedWidget() {
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
}
