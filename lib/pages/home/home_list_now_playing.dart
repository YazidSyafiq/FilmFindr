import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeListNowPlaying extends StatelessWidget {
  const HomeListNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        final nowPlaying = homeController.listNowPlaying[index];
        return Container(
          margin: const EdgeInsets.only(right: 16),
          width: 190,
          decoration: BoxDecoration(
            color: ColorCollection.offWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://media.themoviedb.org/t/p/w220_and_h330_face${nowPlaying.posterPath}',
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: ColorCollection.background,
                    highlightColor: ColorCollection.lightBlue,
                    child: Container(
                      color: ColorCollection.lightBlue,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 50,
                        color: ColorCollection.red,
                      ),
                    );
                  },
                  width: 190,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorCollection.background,
                        ),
                        child: Icon(
                          Icons.favorite_outline,
                          color: ColorCollection.offWhite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorCollection.background,
                        ),
                        child: Icon(
                          Icons.bookmark_outline,
                          color: ColorCollection.offWhite,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {},
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
