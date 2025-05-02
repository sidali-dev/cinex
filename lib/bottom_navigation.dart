import 'package:cinex/app/controllers/navigation_controller.dart';
import 'package:cinex/app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'app/theme/app_colors.dart';

class BottomNavigation extends GetView<NavigationController> {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.currentIndex.value) {
          case 0:
            return HomeView();
          case 1:
            return SizedBox();
          case 2:
            return SizedBox();
          default:
            return SizedBox.shrink();
        }
      }),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changePage,
          indicatorColor: AppColors.primary(context),
          elevation: 0,
          backgroundColor: AppColors.background(context),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: 820.milliseconds,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              selectedIcon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.search_normal),
              selectedIcon: Icon(Iconsax.search_favorite),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.bookmark_2),
              selectedIcon: Icon(Iconsax.bookmark),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
