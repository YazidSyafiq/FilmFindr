import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

TableRow buildTableRow({
  required String title,
  required String content,
}) {
  return TableRow(
    children: [
      Text(
        title,
        style: TextStyleCollection.title.copyWith(
          color: ColorCollection.offWhite,
          fontSize: 14,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          content,
          style: TextStyleCollection.subtitle.copyWith(
            color: ColorCollection.offWhite,
            fontSize: 14,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    ],
  );
}
