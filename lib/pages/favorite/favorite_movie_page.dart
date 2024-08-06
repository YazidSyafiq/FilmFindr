import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:filmfindr/pages/favorite/favorite_movie_empty.dart';
import 'package:filmfindr/widgets/button_favorite_watch_list_download_widget.dart';
import 'package:filmfindr/widgets/poster_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviePage extends StatelessWidget {
  const FavoriteMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.put(FavoriteController());
    WatchListController watchListController = Get.put(WatchListController());

    return Scaffold(
      backgroundColor: ColorCollection.background,
      appBar: AppBar(
        title: Text(
          'Favorite Movie',
          style: TextStyleCollection.title,
        ),
        centerTitle: true,
        backgroundColor: ColorCollection.background,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(
              ColorCollection.lightBlue,
            ),
          ),
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorCollection.offWhite,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () {
            if (favoriteController.isLoadingFavorite.value) {
              return Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: ColorCollection.red,
                  ),
                ),
              );
            } else if (favoriteController.favoriteMovie.isEmpty) {
              return const FavoriteMovieEmpty();
            } else {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 14,
                    mainAxisSpacing: 7.5,
                    crossAxisSpacing: 7.5,
                  ),
                  itemCount: favoriteController.favoriteMovie.length,
                  itemBuilder: (context, index) {
                    final favoriteMovie =
                        favoriteController.favoriteMovie[index];

                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorCollection.lightBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: PosterWidget(
                                urlPoster: favoriteMovie.posterPath ?? '',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            ButtonFavoriteWatchListDownloadWidget(
                              favoriteController: favoriteController,
                              watchListController: watchListController,
                              movieId: favoriteMovie.id ?? 0,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
