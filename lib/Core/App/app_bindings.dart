import 'package:get/instance_manager.dart';
import 'package:keep_n_touch/Presentation/Chat/controller/chat_controller.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupsController>(() => GroupsController());
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
