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
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class ChatRoomBar extends StatelessWidget {
  final RoomModel model;

  const ChatRoomBar({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String contactId = model.members!.where((e) => e != userId).first;
    final data = FirebaseFirestore.instance
        .collection(AppStrings.usersCollection)
        .doc(contactId)
        .snapshots();

    return StreamBuilder(
        stream: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ContactModel contactModel =
                ContactModel.fromJson(snapshot.data!.data()!);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => MyApp.navigation.goBack(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                CustomText(
                  text: contactModel.name!,
                  fontSize: 25,
                  color: AppColors.mainColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CustomCachedImage(
                    height: 45,
                    width: 45,
                    photoUrl: contactModel.photo!,
                  ),
                )
              ],
            );
          } else {
            return const CustomText(text: 'Error loading Data');
          }
        });
  }
}
