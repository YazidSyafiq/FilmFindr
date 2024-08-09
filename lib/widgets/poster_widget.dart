import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmfindr/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.urlPoster,
    this.width,
    this.height,
  });

  final String urlPoster;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://media.themoviedb.org/t/p/w220_and_h330_face$urlPoster',
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
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
