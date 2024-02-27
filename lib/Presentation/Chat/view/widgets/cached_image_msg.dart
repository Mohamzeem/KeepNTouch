import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';

class CachedImageMessage extends StatelessWidget {
  final String photoUrl;
  final bool isUser;

  const CachedImageMessage({
    Key? key,
    required this.photoUrl,
    this.isUser = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl.isEmpty ? AppStrings.noImage : photoUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const CircularProgressIndicator(color: AppColors.mainColor),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? 15 : 0),
            topRight: Radius.circular(isUser ? 0 : 15),
            bottomLeft: const Radius.circular(15),
            bottomRight: const Radius.circular(15),
          ),
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
    );
  }
}
