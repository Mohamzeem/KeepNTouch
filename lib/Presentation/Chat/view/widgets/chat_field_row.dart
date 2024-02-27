import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';

class ChatFieldRow extends StatelessWidget {
  final VoidCallback sendMsg;
  final VoidCallback sendImage;
  final TextEditingController controller;
  const ChatFieldRow({
    Key? key,
    required this.sendMsg,
    required this.sendImage,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: AppColors.mainColor,
                width: 0.5,
              ),
            ),
            // width: 306.w,
            child: TextFormField(
              controller: controller,
              autofocus: false,
              style: const TextStyle(fontSize: 22, color: AppColors.kBlack),
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.upload_file,
                      color: AppColors.mainColor,
                      size: 30.r,
                    ),
                    SizedBox(width: 5.w),
                    InkWell(
                      onTap: sendImage,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.mainColor,
                        size: 30.r,
                      ),
                    ),
                    SizedBox(width: 5.w),
                  ],
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0.h,
                  horizontal: 10.w,
                ),
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: AppColors.kWhite)),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: AppColors.kWhite)),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: AppColors.kWhite)),
                errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: AppColors.kWhite)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: AppColors.kWhite)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
            onTap: sendMsg,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.secColor,
              child: const Icon(
                Icons.send,
                size: 30,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
