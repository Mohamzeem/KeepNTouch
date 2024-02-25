import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomSnackBar {
  static Future showSuccessSnackBar(
      {required BuildContext context, required String message}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        duration: const Duration(seconds: 3),
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Center(
          child: CustomText(
            text: message,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  static Future showErrorSnackBar(
      {required BuildContext context, required String message}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        // behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Center(
          child: CustomText(
            text: message,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
