import 'package:filmfindr/constants/asset_constant.dart';
import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/controllers/home_controller.dart';
import 'package:filmfindr/pages/home/home_list_now_playing.dart';
import 'package:filmfindr/pages/home/home_loading_now_playing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: ColorCollection.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Center(
                  child: Image.asset(
                    AssetsCollection.letter,
                    width: 250,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 0.5,
                        color: ColorCollection.lightBlue,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Referensi film terlengkap, temukan film-film terbaru dan menarik di sini',
                        style: TextStyleCollection.subtitle,
                        textAlign: TextAlign.center,
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
                        'Now Playing',
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
                        child: Obx(
                          () {
                            if (homeController.isLoadingNowPlaying.value) {
                              return const HomeLoadingNowPlaying();
                            } else {
                              return const HomeListNowPlaying();
                            }
                          },
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
                      Text(
                        'Popular',
                        style: TextStyleCollection.title,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
