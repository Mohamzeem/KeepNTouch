import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/routes/base_routes.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/auth_page_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/complete_register_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/forgot_password_view.dart';
import 'package:keep_n_touch/Presentation/Authentication/view/login_view.dart';
import 'package:keep_n_touch/Presentation/Chat/view/chat_room_view.dart';
import 'package:keep_n_touch/Presentation/Control/view/control_view.dart';

abstract class AppRouter {
  // static const String onboardingView = "onboardingView";
  static const String loginView = "loginView";
  static const String completeRegisterView = "completeRegisterView";
  static const String forgotPasswordView = "forgotPasswordView";
  static const String controlView = "controlView";
  static const String chatRoomView = "chatRoomView";
  static const String authPageView = "authPageView";
  // static const String calenderView = "calenderView";
  // static const String aiSearchView = "aisearchView";
  // static const String growModelView = "growModelView";
  // static const String growModelDetailsView = "growModelDetailsView";
  // static const String addGrowModelView = "addGrowModelView";
  // static const String editGrowModelView = "editGrowModelView";
  // static const String ratingView = "ratingView";
  // static const String profileView = "profileView";
  // static const String fastCoachingWebView = "fastCoachingWebView";
  // static const String localNotifications = "localNotifications";
  // static const String profileEditView = "profileEditView";
  // static const String updatePasswordView = "updatePasswordView";
  // static const String notificationsView = "notificationsView";
  // static const String sessionsView = "sessionsView";
  // static const String showSessionsView = "showSessionsView";

  static Route<void> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case authPageView:
        return BaseRoute(const AuthPageView());
      case loginView:
        return BaseRoute(const LoginView());
      case completeRegisterView:
        return BaseRoute(const CompleteRegisterView());
      case forgotPasswordView:
        return BaseRoute(const ForgotPasswordView());
      case controlView:
        return BaseRoute(const ControlView());
      case chatRoomView:
        return BaseRoute(ChatRoomView(
          roomModel: args as RoomModel,
        ));

      // case updatePasswordView:
      //   return BaseRoute(const UpdatePasswordView());

      // case notificationsView:
      //   return BaseRoute(const NotificationsView());

      default:
        return BaseRoute(const AuthPageView());
    }
  }
}
