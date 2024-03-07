import 'package:get/instance_manager.dart';
import 'package:keep_n_touch/Presentation/Authentication/controller/auth_controller.dart';
import 'package:keep_n_touch/Presentation/Chat/controller/chat_controller.dart';
import 'package:keep_n_touch/Presentation/Contacts/controller/contacts_controller.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';
import 'package:keep_n_touch/Presentation/Home/controller/home_controller.dart';
import 'package:keep_n_touch/Presentation/Settings/controller/settings_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<GroupsController>(() => GroupsController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<ContactsController>(() => ContactsController());
  }
}
