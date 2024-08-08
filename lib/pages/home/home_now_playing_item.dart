import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/save_image_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:filmfindr/pages/detail/detail_page.dart';
import 'package:filmfindr/widgets/button_favorite_watch_list_download_widget.dart';
import 'package:filmfindr/widgets/poster_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNowPlayingItem extends StatelessWidget {
  const HomeNowPlayingItem({
    super.key,
    required this.urlPoster,
    required this.favoriteController,
    required this.watchListController,
    required this.movieId,
    required this.saveImageController,
    required this.movieName,
  });

  final String urlPoster;
  final int movieId;
  final FavoriteController favoriteController;
  final WatchListController watchListController;
  final SaveImageController saveImageController;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailPage(
            movieId: movieId,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 190,
        decoration: BoxDecoration(
          color: ColorCollection.lightBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: PosterWidget(
                urlPoster: urlPoster,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            ButtonFavoriteWatchListDownloadWidget(
              favoriteController: favoriteController,
              watchListController: watchListController,
              movieId: movieId,
              saveImageController: saveImageController,
              urlPoster: urlPoster,
              movieName: movieName,
            )
          ],
        ),
      ),
    );
  }
}
