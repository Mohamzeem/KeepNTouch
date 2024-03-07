import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:keep_n_touch/Core/Models/user_model.dart';

class AuthStates {
  bool isFirstTime = true;
  Rx<UserModel> userModel = const UserModel().obs;
}
