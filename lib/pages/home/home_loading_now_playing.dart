import 'package:filmfindr/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingNowPlaying extends StatelessWidget {
  const HomeLoadingNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            width: 190,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Shimmer.fromColors(
                baseColor: ColorCollection.background,
                highlightColor: ColorCollection.lightBlue,
                child: Container(
                  color: ColorCollection.lightBlue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
