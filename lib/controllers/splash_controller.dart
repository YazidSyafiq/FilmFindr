import 'package:filmfindr/pages/home/home_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splash();
    super.onInit();
  }

  void splash() {
    // Mengatur durasi splash page yaitu 3 detik
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Mengatur navigasi, setelah 3 detik akan diarahkan ke home page
        Get.offAll(
          () => const HomePage(),
        );
      },
    );
  }
}
