import 'package:cinex/app/controllers/theme_controller.dart';
import 'package:cinex/app/theme/app_colors.dart';
import 'package:cinex/app/views/home_movies/home_movies_view.dart';
import 'package:cinex/app/views/home_tv_shows/home_tv_shows_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      floatingActionButton: GestureDetector(
        child: CircleAvatar(
          backgroundColor: AppColors.primary(context).withValues(alpha: 0.8),
          child: Icon(
            themeController.isDark.value ? Iconsax.moon5 : Iconsax.sun_1,
          ),
        ),
        onTap: () {
          themeController.switchTheme();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: DefaultTabController(
        length: controller.tabs.length,
        initialIndex: controller.selectedTabIndex.value,
        child: Stack(
          children: [
            TabBarView(children: [
              HomeMoviesView(),
              HomeTvShowsView(),
            ]),
            Positioned(
              top: 50,
              left: 100,
              right: 100,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: AppColors.primary(context),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    tabs: controller.tabs),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
