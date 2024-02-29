import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/custom_app_bar.dart';
import 'package:keep_n_touch/Presentation/Chat/view/widgets/list_room.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Chats',
            isSearch: false,
            onTap: () {},
            onTapInSearch: () {},
          ),
          const ListRoom(),
        ],
      ),
    );
  }
}
