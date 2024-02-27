import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/cached_image_msg.dart';

class ContactMsg extends StatelessWidget {
  final String msg;
  final String createdAt;
  final String photoUrl;
  final bool isText;
  final bool isRead;
  final bool isUser;

  const ContactMsg({
    super.key,
    required this.msg,
    required this.createdAt,
    required this.photoUrl,
    required this.isText,
    required this.isRead,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  child: CustomCachedImage(
                    width: 35,
                    height: 35,
                    photoUrl: photoUrl,
                    child: Container(),
                  ),
                ),
                isText
                    ? Card(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 280.h),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: CustomText(
                            text: msg,
                            color: AppColors.kWhite,
                          ),
                        ),
                      )
                    : Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          constraints: const BoxConstraints(
                            maxHeight: 200,
                            maxWidth: 150,
                          ),
                          child: CachedImageMessage(
                            photoUrl: msg,
                            isUser: false,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          CustomText(
            text: createdAt,
            color: Colors.grey.shade600,
          ),
          if (isUser == false) ...[
            SizedBox(width: 5.w),
            Icon(
              Icons.check_circle_outlined,
              color: isRead ? AppColors.mainColor : AppColors.kGrey,
              size: 22,
            ),
          ],
        ],
      ),
    );
  }
}
