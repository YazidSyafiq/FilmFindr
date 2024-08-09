import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/save_image_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonFavoriteWatchListDownloadWidget extends StatelessWidget {
  const ButtonFavoriteWatchListDownloadWidget({
    super.key,
    required this.favoriteController,
    required this.watchListController,
    required this.movieId,
    required this.saveImageController,
    required this.urlPoster,
    required this.movieName,
  });

  final int movieId;
  final FavoriteController favoriteController;
  final WatchListController watchListController;
  final SaveImageController saveImageController;
  final String urlPoster;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              favoriteController.addRemoveFavorite(
                movieId,
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorCollection.background,
              ),
              child: Obx(
                () {
                  if (favoriteController.isLoadingItem[movieId] == true) {
                    return Center(
                      child: SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          color: ColorCollection.offWhite,
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  } else {
                    bool isFavorite = favoriteController.favoriteMovie.any(
                      (favorite) => favorite.id == movieId,
                    );
                    return Icon(
                      isFavorite == true
                          ? Icons.favorite_outlined
                          : Icons.favorite_outline,
                      color: isFavorite == true
                          ? ColorCollection.red
                          : ColorCollection.offWhite,
                      size: 20,
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              watchListController.addRemoveWatchList(
                movieId,
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorCollection.background,
              ),
              child: Obx(
                () {
                  bool isWatchList = watchListController.watchList.any(
                    (watchList) => watchList.id == movieId,
                  );
                  if (watchListController.isLoadingItem[movieId] == true) {
                    return Center(
                      child: SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          color: ColorCollection.offWhite,
                          strokeWidth: 1,
                        ),
                      ),
                    );
                  } else {
                    return Icon(
                      isWatchList == true
                          ? Icons.bookmark_outlined
                          : Icons.bookmark_outline,
                      color: ColorCollection.offWhite,
                      size: 20,
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              saveImageController.saveImage(
                urlPoster,
                movieName,
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorCollection.background,
              ),
              child: Icon(
                Icons.file_download_outlined,
                color: ColorCollection.offWhite,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
