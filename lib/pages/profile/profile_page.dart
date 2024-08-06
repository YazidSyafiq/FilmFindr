import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmfindr/constants/asset_constant.dart';
import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/controllers/profile_controller.dart';
import 'package:filmfindr/pages/favorite/favorite_movie_page.dart';
import 'package:filmfindr/pages/watch_list/watch_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(
      ProfileController(),
    );

    return Scaffold(
      backgroundColor: ColorCollection.background,
      body: SafeArea(
        child: Obx(
          () {
            if (profileController.isLoadingProfile.value) {
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: ColorCollection.red,
                  ),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 48,
                      bottom: 24,
                    ),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w200${profileController.profile.value.avatar?.tmdb?.avatarPath ?? '/6WauwyGPA2rzlZIu2KFfArwL0JP.png'}',
                        imageBuilder: (context, imageProvider) {
                          return CircleAvatar(
                            radius: 75,
                            backgroundImage: imageProvider,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    profileController.profile.value.name ?? '',
                    style: TextStyleCollection.title,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    profileController.profile.value.username ?? '',
                    style: TextStyleCollection.subtitle,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const FavoriteMoviePage(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: ColorCollection.red,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            AssetsCollection.pattern,
                          ),
                          opacity: 0.7,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: ColorCollection.offWhite,
                              size: 36,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Favorite Movie',
                              style: TextStyleCollection.title.copyWith(
                                color: ColorCollection.offWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const WatchListPage(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: ColorCollection.red,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            AssetsCollection.pattern,
                          ),
                          opacity: 0.7,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: ColorCollection.offWhite,
                              size: 36,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Watch List',
                              style: TextStyleCollection.title.copyWith(
                                color: ColorCollection.offWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
