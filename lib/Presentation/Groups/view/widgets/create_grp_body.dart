import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_app_bar.dart';
import 'package:keep_n_touch/Core/Widgets/custom_button.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Presentation/Groups/controller/grps.controller.dart';
import 'package:keep_n_touch/Presentation/Groups/view/widgets/grp_room_contacts_list.dart';

class CreateGroupBody extends StatelessWidget {
  const CreateGroupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomAppBar(
                searchLabel: 'Member Name',
                photoUrl: "",
                isLeftPhoto: false,
                title: 'Group Image and Memebers',
                onTap: () {},
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5,
                  color: AppColors.kWhite,
                  surfaceTintColor: AppColors.kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    side: BorderSide(color: AppColors.secColor),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        FirebaseAuth.instance.currentUser!.photoURL == "" ||
                                FirebaseAuth.instance.currentUser!.photoURL ==
                                    null ||
                                FirebaseAuth
                                    .instance.currentUser!.photoURL!.isEmpty
                            ? AppStrings.noImage
                            : FirebaseAuth.instance.currentUser!.photoURL!,
                    fit: BoxFit.fill,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // border: Border.all(width: 0.5, color: AppColors.mainColor),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          FluentIcons.camera_16_regular,
                          color: AppColors.kBlack,
                          size: 30,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 40,
                      color: AppColors.kRed,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              if (controller.states.isChecked) ...[
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CustomCachedImage(
                          photoUrl: AppStrings.defaultAppPhoto,
                          height: 45,
                          width: 45,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Transform.scale(
                              scale: 1.3,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kGrey.withOpacity(0.5),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 10,
                                  color: AppColors.kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const GroupRoomsContactsList(),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () => controller.createGroupRoom(
                  grpMembers: ['1', FirebaseAuth.instance.currentUser!.uid],
                  context: context,
                ),
                text: 'Create Group',
                width: double.infinity,
                textColor: AppColors.kBlack,
                height: 45,
                threeRadius: 10,
                lastRadius: 10,
                backgroundColor: AppColors.mainColor,
              ),
              SizedBox(height: Platform.isIOS ? 10.h : 10.h),
            ],
          ),
        );
      },
    );
  }
}
