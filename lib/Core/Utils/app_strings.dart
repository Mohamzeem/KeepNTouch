class AppStrings {
  AppStrings();

//~ Globals
  static String fontFamily = 'MouseMemoirs';
  static const String defaultEmail = '@gmail.com';
  static String? userId = '';
  static String? userPhoto = '';
  static String? userName = '';
  static String? role = '';
  static const String defaultAppPhoto =
      "https://firebasestorage.googleapis.com/v0/b/chat-app-df0f1.appspot.com/o/account.png?alt=media&token=fd6675d2-ead9-4f50-9e14-4fddbb4ce864";

  //~ Firebase Collections
  static const String chatCollection = 'Chat';
  static const String usersCollection = 'Users';
  static const String messagesCollection = 'Messages';
  static String notificationsCollection = 'Notifications';

  //~ Agora
  static String agoraAppId = 'd0e95cf95b5347e39735b2da6d1884a3';

  //~ Zego Cloud
  static const int zegoAppID = 873584565;
  static const String zegoAppSign =
      '25389dba7fe01f88621a96d6b7c1075c4841dd562e7f7d499d76b924731287bf';
}
