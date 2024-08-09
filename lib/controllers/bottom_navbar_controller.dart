import 'package:filmfindr/pages/home/home_page.dart';
import 'package:filmfindr/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  // List page
  List<Widget> get optionPage => [
        const HomePage(),
        const ProfilePage(),
      ];

  // Fungsi untuk get index page
  void getInitialIndex({required int index}) {
    selectedIndex.value = index;
  }
}
