import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keep_n_touch/Core/App/app_info.dart';
import 'package:keep_n_touch/Core/Models/contact_model.dart';
import 'package:keep_n_touch/Core/Models/room_model.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_circular_loading.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';
import 'package:keep_n_touch/Core/routes/app_routes.dart';

class ListRoomItem extends StatelessWidget {
  final RoomModel roomModel;
  const ListRoomItem({
    super.key,
    required this.roomModel,
  });

  @override
  Widget build(BuildContext context) {
    //^ get contact id from the room model members
    final String contactId = roomModel.members!
        .where((e) => e != FirebaseAuth.instance.currentUser!.uid)
        .first;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(AppStrings.usersCollection)
          .doc(contactId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ContactModel model =
              ContactModel.fromJson(snapshot.data!.data()!);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: InkWell(
              onTap: () {
                MyApp.navigation
                    .navigateTo(AppRouter.chatRoomView, args: roomModel);
              },
              child: SizedBox(
                height: 60,
                child: Card(
                  elevation: 5,
                  color: AppColors.kCard,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                    child: Row(
                      children: [
                        CustomCachedImage(
                          height: 40,
                          width: 40,
                          photoUrl: model.isPhoto,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            CustomText(
                              text: model.name!,
                              fontSize: 17,
                            ),
                            CustomText(
                              text: roomModel.lastMessage!,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CustomText(text: 'Hello'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (!snapshot.hasData) {
          return const CustomText(text: 'NO chats found...');
        }
        return const CustomCircularLoading(height: 50, width: 50);
      },
    );
  }
}
