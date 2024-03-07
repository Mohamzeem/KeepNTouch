import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';

class SettingsStates {
  RxString userName = ''.obs;
  RxString userPhoto = ''.obs;
  Rx<UserModel> userModel = const UserModel().obs;
}
