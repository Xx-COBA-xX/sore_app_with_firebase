// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/helpers/helper_func.dart';
import 'package:sore_app_with_firebase/feaures/personalization/screens/setteings/setteings_screen.dart';
import 'package:sore_app_with_firebase/feaures/shop/models/bottom_nav_bar/botton_nav_bar_data.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/home/home_screen.dart';
import 'package:sore_app_with_firebase/feaures/shop/screens/wishlist/wishlist_screen.dart';

import 'feaures/shop/screens/store/store_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(BottomController());
    return Scaffold(
        body: Obx(() => controller.screens[controller.currentIndex.value]),
        bottomNavigationBar: Container(
          height: 70,
          decoration:
              BoxDecoration(color: isDark ? AppColors.black : AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () => controller.changeIndex(index),
                      padding: EdgeInsets.zero,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: SvgPicture.asset(
                          height: 30,
                          controller.currentIndex.value == index
                              ? BottonData.bottomData[index].selectIcon
                              : BottonData.bottomData[index].noneSelectIcon,
                          color: isDark
                              ? controller.currentIndex.value != index
                                  ? AppColors.white
                                  : AppColors.primary
                              : controller.currentIndex.value != index
                                  ? AppColors.dark
                                  : AppColors.primary,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      height: 5,
                      width: controller.currentIndex.value == index ? 27 : 0,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}

class BottomController extends GetxController {
  Rx<int> currentIndex = 0.obs;

  final List<Widget> screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    const SetteingScreen()
  ];
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
