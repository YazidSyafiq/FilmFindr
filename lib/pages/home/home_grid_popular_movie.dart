import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/popular_movie_controller.dart';
import 'package:filmfindr/controllers/save_image_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:filmfindr/pages/home/home_popular_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeGridPopularMovie extends StatelessWidget {
  const HomeGridPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    // Menginisialisasi controller yang diperlukan
    PopularMovieController popularMovieController =
        Get.put(PopularMovieController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    WatchListController watchListController = Get.put(WatchListController());
    SaveImageController saveImageController = Get.put(SaveImageController());

    return Obx(
      () {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 14,
            mainAxisSpacing: 7.5,
            crossAxisSpacing: 7.5,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: popularMovieController.popularMovie.length,
          itemBuilder: (context, index) {
            final popularMovie = popularMovieController.popularMovie[index];

            // widget untuk menampilkan item movie
            return HomePopularMovieItem(
              urlPoster: popularMovie.posterPath ?? '',
              favoriteController: favoriteController,
              watchListController: watchListController,
              movieId: popularMovie.id ?? 0,
              saveImageController: saveImageController,
              movieName: popularMovie.title ?? '',
            );
          },
        );
      },
    );
  }
}
