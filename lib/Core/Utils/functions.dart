import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Widgets/custom_snack_bar.dart';

class AppFucntions {
  AppFucntions._();

  static bool validateCredentials(BuildContext context, String? email) {
    String msg = '';
    if (email == null || email.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
          context: context, message: 'Please enter email');
      return false;
    } else if (email.contains(' ')) {
      CustomSnackBar.showErrorSnackBar(
          context: context, message: 'Email should not contain spaces');
      return false;
    }
    CustomSnackBar.showErrorSnackBar(context: context, message: msg);

    // var status = validateEmail(email);
    // if (!status) {
    //   CustomSnackBar.showErrorSnackBar(
    //       context: context, message: 'Please enter a valid email id');
    //   return false;
    // }
    return true;
  }

  static bool validateEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    var status = regExp.hasMatch(email);
    return status;
  }
}
