import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.kWhite,
      surfaceTintColor: AppColors.kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: BorderSide(color: AppColors.secColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CachedNetworkImage(
          imageUrl: FirebaseAuth.instance.currentUser!.photoURL == "" ||
                  FirebaseAuth.instance.currentUser!.photoURL == null ||
                  FirebaseAuth.instance.currentUser!.photoURL!.isEmpty
              ? AppStrings.noImage
              : FirebaseAuth.instance.currentUser!.photoURL!,
          fit: BoxFit.fill,
          imageBuilder: (context, imageProvider) => Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(width: 0.5, color: AppColors.mainColor),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
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
    );
  }
}
