import 'package:filmfindr/constants/asset_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class FavoriteMovieEmpty extends StatelessWidget {
  const FavoriteMovieEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Menampilkan gambar icon favorite movie kosong
          Center(
            child: Image.asset(
              AssetsCollection.favoriteEmpty,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // Menampilkan teks "Film Favorit Kosong" dengan gaya teks title
          Text(
            'Film Favorit Kosong',
            style: TextStyleCollection.title,
          ),
          const SizedBox(
            height: 4,
          ),
          // Menampilkan deskripsi mengenai favorite movie kosong
          Text(
            'Anda belum menambahkan film ke daftar favorit. Ayo tambahkan segera untuk pengalaman yang lebih menarik!',
            style: TextStyleCollection.subtitle.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
