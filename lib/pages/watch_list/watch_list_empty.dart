import 'package:filmfindr/constants/asset_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class WatchListEmpty extends StatelessWidget {
  const WatchListEmpty({super.key});

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
          // Menampilkan gambar icon watch list kosong
          Center(
            child: Image.asset(
              AssetsCollection.watchListEmpty,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // Menampilkan teks "Watch List Kosong" dengan gaya teks title
          Text(
            'Watch List Kosong',
            style: TextStyleCollection.title,
          ),
          const SizedBox(
            height: 4,
          ),
          // Menampilkan deskripsi mengenai watch list kosong
          Text(
            'Anda belum menandai film yang akan anda tonton. Segera masukkan film-film terbaik ke dalam watch list anda!',
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
