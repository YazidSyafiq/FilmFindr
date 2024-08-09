import 'package:filmfindr/constants/color_constant.dart';
import 'package:get/get.dart';

// Class untuk menampung style snackbar
class SnackbarStyleConstant {
  static void errorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: ColorCollection.red.withOpacity(0.75),
      colorText: ColorCollection.offWhite,
    );
  }

  static void successSnackBar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: ColorCollection.platinum.withOpacity(0.75),
      colorText: ColorCollection.background,
      duration: const Duration(
        seconds: 3,
      ),
    );
  }
}
