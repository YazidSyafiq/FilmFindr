import 'package:filmfindr/constants/asset_constant.dart';
import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/pages/home/home_grid_popular_movie.dart';
import 'package:filmfindr/pages/home/home_list_now_playing.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollection.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Menampilkan logo
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
              // Bagian utama yang menampilkan daftar film (now playing dan popular)
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
                      // Menampilkan teks deskripsi
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
                      // Widget untuk menampilkan now playing movie dalam bentuk list horizontal
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const HomeListNowPlaying(),
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
                      // Widget untuk menampilkan daftar popular movie dalam bentuk grid
                      const HomeGridPopularMovie(),
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
