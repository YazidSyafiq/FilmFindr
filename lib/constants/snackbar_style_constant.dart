import 'package:filmfindr/constants/color_constant.dart';
import 'package:get/get.dart';

class SnackbarStyleConstant {
  static void errorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: ColorCollection.red.withOpacity(0.75),
      colorText: ColorCollection.offWhite,
    );
  }
}
