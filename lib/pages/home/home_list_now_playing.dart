import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/now_playing_controller.dart';
import 'package:filmfindr/controllers/save_image_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:filmfindr/pages/home/home_now_playing_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeListNowPlaying extends StatelessWidget {
  const HomeListNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    // Menginisialisasi controller yang diperlukan
    NowPlayingController nowPlayingController = Get.put(NowPlayingController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    WatchListController watchListController = Get.put(WatchListController());
    SaveImageController saveImageController = Get.put(SaveImageController());

    return Obx(
      () {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              nowPlayingController.listNowPlaying.take(6).toList().length,
          itemBuilder: (context, index) {
            final nowPlaying = nowPlayingController.listNowPlaying[index];

            // Widget untuk menampilkan item movie
            return HomeNowPlayingItem(
              favoriteController: favoriteController,
              watchListController: watchListController,
              urlPoster: nowPlaying.posterPath ?? '',
              movieId: nowPlaying.id ?? 0,
              saveImageController: saveImageController,
              movieName: nowPlaying.title ?? '',
            );
          },
        );
      },
    );
  }
}
