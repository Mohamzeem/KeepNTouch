import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:keep_n_touch/Core/Models/grp_room_model.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/auth_page_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/complete_register_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/forgot_password_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_room_view.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_view.dart';
import 'package:keep_n_touch/Presentation/Contacts/contacts_view.dart';
import 'package:keep_n_touch/Presentation/Home/view/home_view.dart';
import 'package:keep_n_touch/Presentation/Groups/view/create_grp_view.dart';
import 'package:keep_n_touch/Presentation/Groups/view/group_room_view.dart';
import 'package:keep_n_touch/Presentation/Groups/view/groups_view.dart';
import 'package:keep_n_touch/Presentation/Groups/view/group_details_view.dart';
import 'package:keep_n_touch/Presentation/Settings/view/settings_view.dart';

class AppPages {
  AppPages();

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoute.initial,
      page: () => const AuthPageView(),
    ),
    GetPage(
      name: AppRoute.logInView,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoute.forgotPasswordView,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
      name: AppRoute.completeRegistrationView,
      page: () => const CompleteRegisterView(),
    ),
    GetPage(
      name: AppRoute.chatView,
      page: () => const ChatView(),
    ),
    GetPage(
      name: AppRoute.chatRoomView,
      page: () {
        final RoomModel model = Get.arguments;
        return ChatRoomView(roomModel: model);
      },
    ),
    GetPage(
      name: AppRoute.contactsView,
      page: () => const ContactsView(),
    ),
    GetPage(
      name: AppRoute.contactsView,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoute.groupsView,
      page: () => const GroupsView(),
    ),
    GetPage(
      name: AppRoute.groupsRoomView,
      page: () {
        final GroupsRoomModel model = Get.arguments;
        return GroupsRoomView(
          groupsRoomModel: model,
        );
      },
    ),
    GetPage(
      name: AppRoute.settingsView,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: AppRoute.createGroupsView,
      page: () => const CreateGroupView(),
    ),
    GetPage(
      name: AppRoute.groupDetailsView,
      page: () {
        final GroupsRoomModel model = Get.arguments;
        return GroupDetailsView(
          groupsRoomModel: model,
        );
      },
    ),
  ];
}
