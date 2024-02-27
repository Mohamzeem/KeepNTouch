import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class CustomDialog {
  static Future<void> oneButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton,
    required void Function() onPressed,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.kWhite,
          title: const SizedBox(
              width: 200, height: 200, child: Icon(Icons.account_circle_sharp)),
          content: CustomText(
            text: textBody,
          ),
          actions: [
            CustomButton(
              onPressed: onPressed,
              text: textButton,
              width: 320,
              height: 45,
              lastRadius: 10,
              threeRadius: 10,
            )
          ],
        );
      },
    );
  }

  static Future<void> twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
  }) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.secColor,
        title: Center(
          child: CustomText(
            text: textBody,
            softWrap: true,
            fontSize: 25,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: onPressed,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainColor,
                  ),
                  child: Card(
                      color: AppColors.mainColor,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomText(
                          text: textButton1,
                          color: AppColors.kWhite,
                          fontSize: 20,
                        ),
                      )),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kBlack,
                  ),
                  child: Card(
                    color: AppColors.kBlack,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: CustomText(
                          text: textButton2,
                          color: AppColors.kWhite,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
          // CustomButton(
          //   backgroundColor: AppColors.kRed,
          //   onPressed: onPressed,
          //   text: textButton1,
          //   width: 320,
          //   height: 45,
          //   isLoading: isLoading,
          //   lastRadius: 10,
          //   threeRadius: 10,
          // ),
          // const SizedBox(height: 10, width: 1),
          // CustomButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   text: textButton2,
          //   width: 320,
          //   height: 45,
          //   lastRadius: 10,
          //   threeRadius: 10,
          // )
        ],
      ),
    );
  }
}
