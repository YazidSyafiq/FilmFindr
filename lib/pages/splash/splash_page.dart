import 'package:filmfindr/constants/asset_constant.dart';
import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/status_bar_constant.dart';
import 'package:filmfindr/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengatur warna status bar menggunakan StatusBarSetup dari folder constant
    StatusBarSetup.statusbar;

    // Menginisialisasi controller SplashController untuk manajemen data pada splash screen
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: ColorCollection.background,
      body: Center(
        // Menampilkan logo aplikasi
        child: Image.asset(
          AssetsCollection.logo,
          width: 150,
        ),
      ),
    );
  }
}
