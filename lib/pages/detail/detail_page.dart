import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/controllers/detail_movie_controller.dart';
import 'package:filmfindr/controllers/favorite_controller.dart';
import 'package:filmfindr/controllers/save_image_controller.dart';
import 'package:filmfindr/controllers/watch_list_controller.dart';
import 'package:filmfindr/pages/bottom_navigation/bottom_navigation_bar.dart';
import 'package:filmfindr/widgets/button_back_widget.dart';
import 'package:filmfindr/widgets/button_favorite_watch_list_download_widget.dart';
import 'package:filmfindr/widgets/poster_widget.dart';
import 'package:filmfindr/widgets/table_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.movieId,
  });
  final int movieId;

  @override
  Widget build(BuildContext context) {
    DetailMovieController detailMovieController = Get.put(
      DetailMovieController(movieId: movieId),
    );
    FavoriteController favoriteController = Get.put(FavoriteController());
    WatchListController watchListController = Get.put(WatchListController());
    SaveImageController saveImageController = Get.put(SaveImageController());

    return PopScope(
      canPop: false,
      onPopInvoked: (isDetail) {
        if (isDetail) {
          return;
        }

        Get.offAll(
          () => const BottomNavigationBarPage(index: 0),
        );
      },
      child: Scaffold(
        backgroundColor: ColorCollection.background,
        appBar: AppBar(
          title: Text(
            'Detail Movie',
            style: TextStyleCollection.title,
          ),
          centerTitle: true,
          backgroundColor: ColorCollection.background,
          leading: ButtonBackWidget(
            onPressed: () {
              Get.offAll(
                () => const BottomNavigationBarPage(index: 0),
              );
            },
          ),
        ),
        body: Obx(
          () {
            if (detailMovieController.isLoadingDetailMovie.value) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: ColorCollection.red,
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: PosterWidget(
                            urlPoster: detailMovieController
                                    .detailMovie.value.posterPath ??
                                '',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Divider(
                        thickness: 0.5,
                        color: ColorCollection.lightBlue,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Table(
                        columnWidths: const {
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          buildTableRow(
                            title: 'Title',
                            content:
                                detailMovieController.detailMovie.value.title ??
                                    '',
                          ),
                          const TableRow(
                            children: [
                              SizedBox(height: 12),
                              SizedBox(height: 12),
                            ],
                          ),
                          buildTableRow(
                            title: 'Overview',
                            content: detailMovieController
                                    .detailMovie.value.overview ??
                                '',
                          ),
                          const TableRow(
                            children: [
                              SizedBox(height: 12),
                              SizedBox(height: 12),
                            ],
                          ),
                          buildTableRow(
                            title: 'Release Date',
                            content: DateFormat('dd MMMM yyyy').format(
                              detailMovieController
                                      .detailMovie.value.releaseDate ??
                                  DateTime.now(),
                            ),
                          ),
                          const TableRow(
                            children: [
                              SizedBox(height: 12),
                              SizedBox(height: 12),
                            ],
                          ),
                          buildTableRow(
                            title: 'Genres',
                            content: detailMovieController
                                    .detailMovie.value.genres
                                    ?.map((genre) => genre.name)
                                    .join(', ') ??
                                '',
                          ),
                          const TableRow(
                            children: [
                              SizedBox(height: 12),
                              SizedBox(height: 12),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Divider(
                        thickness: 0.5,
                        color: ColorCollection.lightBlue,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Similar Movie',
                        style: TextStyleCollection.title,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: detailMovieController.similarMovie.length,
                          itemBuilder: (context, index) {
                            final similarMovie =
                                detailMovieController.similarMovie[index];
                            return GestureDetector(
                              onTap: () {
                                Get.offAll(
                                  () => DetailPage(
                                    movieId: similarMovie.id ?? 0,
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
                                        urlPoster:
                                            similarMovie.posterPath ?? '',
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    ButtonFavoriteWatchListDownloadWidget(
                                      favoriteController: favoriteController,
                                      watchListController: watchListController,
                                      movieId: similarMovie.id ?? 0,
                                      saveImageController: saveImageController,
                                      urlPoster: similarMovie.posterPath ?? '',
                                      movieName: similarMovie.title ?? '',
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
