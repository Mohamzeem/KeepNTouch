import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/Widgets/text_form_field.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/custom_app_bar.dart';

class Groupsbody extends StatefulWidget {
  const Groupsbody({
    super.key,
  });

  @override
  State<Groupsbody> createState() => _GroupsbodyState();
}

class _GroupsbodyState extends State<Groupsbody> {
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  bool isChecked = false;
  // bool isCloseSearch = false;
  bool isSearch = false;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomAppBar(
            onTapInSearch: () {},
            onTap: () => setState(() => isSearch = !isSearch),
            title: 'Groups',
            isSearch: isSearch,
            isCloseSearch: isSearch,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.secColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
