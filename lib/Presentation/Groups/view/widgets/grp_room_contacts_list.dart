import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';

class GroupRoomsContactsList extends GetView<GroupsController> {
  const GroupRoomsContactsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext builder, int index) {
          return Card(
            surfaceTintColor: AppColors.secColor,
            color: AppColors.secColor,
            child: InkWell(
              onTap: () => controller.isChecked = !controller.isChecked,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomCachedImage(
                      photoUrl: AppStrings.defaultAppPhoto,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 10),
                    const CustomText(
                      text: 'username',
                      fontSize: 25,
                    ),
                    const Spacer(),
                    GetBuilder<GroupsController>(
                      builder: (_) => Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: controller.states.isChecked,
                            onChanged: (value) => controller.isChecked = value!,
                            activeColor: AppColors.secColor,
                            checkColor: AppColors.mainColor,
                            side: const BorderSide(color: AppColors.mainColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
