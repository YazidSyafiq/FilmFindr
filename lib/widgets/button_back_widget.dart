import 'package:filmfindr/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            Get.back();
          },
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          ColorCollection.lightBlue,
        ),
      ),
      icon: Icon(
        Icons.arrow_back_ios,
        color: ColorCollection.offWhite,
      ),
    );
  }
}
