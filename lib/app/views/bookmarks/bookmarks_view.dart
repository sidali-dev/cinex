import 'package:cinex/app/controllers/bookmarks_controller.dart';
import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/models/movie/movie.dart';
import 'package:cinex/app/views/bookmarks/widgets/bookmark_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../theme/app_colors.dart';

class BookmarksView extends GetView<BookmarksController> {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = HelperFunctions.screenHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: DefaultTabController(
        length: controller.tabs.length,
        initialIndex: controller.selectedTabIndex.value,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
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
            Expanded(
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.isError.value) {
                    return const Center(child: Text("Error loading bookmarks"));
                  }

                  return TabBarView(
                    children: [
                      BookmarkCardColumn(
                          controller: controller,
                          height: height,
                          isMovie: true),
                      BookmarkCardColumn(
                          controller: controller,
                          height: height,
                          isMovie: false),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkCardColumn extends StatelessWidget {
  const BookmarkCardColumn({
    super.key,
    required this.controller,
    required this.height,
    required this.isMovie,
  });

  final BookmarksController controller;
  final double height;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    List<Movie> movieList =
        isMovie ? controller.movieList : controller.tvShowsList;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () {
          if (movieList.isEmpty) {
            return const Center(
              child: Text(
                "No Bookmarks",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return ListView.separated(
            itemCount: movieList.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.0);
            },
            itemBuilder: (context, index) => BookmarkCard(
              movie: movieList[index],
              width: height * 0.16,
              height: height * 0.24,
              onTap: (id) {
                controller.removeBookmark(id, isMovie);
              },
            ),
          );
        },
      ),
    );
  }
}
