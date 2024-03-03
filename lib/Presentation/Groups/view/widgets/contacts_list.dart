import 'package:flutter/material.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Core/Utils/app_strings.dart';
import 'package:keep_n_touch/Core/Widgets/custom_cached_image.dart';
import 'package:keep_n_touch/Core/Widgets/custom_text.dart';

class ContactsList extends StatefulWidget {
  bool isChecked;
  ContactsList({
    super.key,
    this.isChecked = false,
  });

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext builder, int index) {
          return Card(
            surfaceTintColor: AppColors.secColor,
            color: AppColors.secColor,
            child: InkWell(
              onTap: () {
                setState(() => widget.isChecked = !widget.isChecked);
                print('${widget.isChecked} is checked');
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: widget.isChecked,
                          onChanged: (value) =>
                              setState(() => widget.isChecked = value!),
                          activeColor: AppColors.secColor,
                          checkColor: AppColors.mainColor,
                          side: const BorderSide(color: AppColors.mainColor),
                        ),
                      ),
                    )
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
