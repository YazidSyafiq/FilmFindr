import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/save_image_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:filmfindr/pages/watch_list/watch_list_empty.dart';
import 'package:filmfindr/widgets/button_favorite_watch_list_download_widget.dart';
import 'package:filmfindr/widgets/poster_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.put(FavoriteController());
    WatchListController watchListController = Get.put(WatchListController());
    SaveImageController saveImageController = Get.put(SaveImageController());

    return Scaffold(
      backgroundColor: ColorCollection.background,
      appBar: AppBar(
        title: Text(
          'Watch List',
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
            if (watchListController.isLoadingWatchList.value) {
              return Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: ColorCollection.red,
                  ),
                ),
              );
            } else if (watchListController.watchList.isEmpty) {
              return const WatchListEmpty();
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
                  itemCount: watchListController.watchList.length,
                  itemBuilder: (context, index) {
                    final watchListMovie = watchListController.watchList[index];

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
                                urlPoster: watchListMovie.posterPath ?? '',
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            ButtonFavoriteWatchListDownloadWidget(
                              favoriteController: favoriteController,
                              watchListController: watchListController,
                              movieId: watchListMovie.id ?? 0,
                              saveImageController: saveImageController,
                              urlPoster: watchListMovie.posterPath ?? '',
                              movieName: watchListMovie.title ?? '',
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
