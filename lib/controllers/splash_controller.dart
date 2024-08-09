import 'package:filmfindr/pages/bottom_navigation/bottom_navigation_bar.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // Menginisialisasi controller dengan memanggil 'splash()'
  @override
  void onInit() {
    splash();
    super.onInit();
  }

  // Fungsi untuk splash
  void splash() {
    // Mengatur durasi splash page yaitu 3 detik
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Mengatur navigasi, setelah 3 detik akan diarahkan ke home page
        Get.offAll(
          () => const BottomNavigationBarPage(
            index: 0,
          ),
        );
      },
    );
  }
}
