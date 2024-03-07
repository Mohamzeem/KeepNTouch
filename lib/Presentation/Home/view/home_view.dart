import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_n_touch/Core/Utils/app_colors.dart';
import 'package:keep_n_touch/Presentation/Home/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: AppColors.secColor,
          child: GetBuilder<HomeController>(
            builder: (controller) => Scaffold(
              extendBody: true,
              body: controller.getSelectedWidget(),
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: AppColors.secColor,
                animationDuration: const Duration(milliseconds: 300),
                height: Platform.isAndroid ? 55 : 42,
                buttonBackgroundColor: AppColors.kCard,
                index: controller.index,
                onTap: (value) => controller.index = value,
                items: controller.states.icons,
              ),
            ),
          )),
    );
  }
}
