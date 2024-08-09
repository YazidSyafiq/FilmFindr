import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/constants/text_style_constant.dart';
import 'package:filmfindr/controllers/bottom_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk bottom navigation bar
    BottomNavbarController bottomNavbarController =
        Get.put(BottomNavbarController());

    // Callback untuk mengatur indeks awal ketika halaman pertama kali dibangun
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        bottomNavbarController.getInitialIndex(index: index);
      },
    );

    return Scaffold(
      backgroundColor: ColorCollection.background,
      body: Obx(
        () {
          return bottomNavbarController.optionPage.elementAt(
            bottomNavbarController.selectedIndex.value,
          );
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return Container(
            height: 75,
            decoration: BoxDecoration(
              color: ColorCollection.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorCollection.offWhite.withOpacity(0.1),
                  offset: const Offset(0, -8),
                  blurRadius: 16,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                  indicatorColor: ColorCollection.lightBlue,
                  labelTextStyle: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return TextStyleCollection.subtitle.copyWith(
                          color: ColorCollection.offWhite,
                          fontSize: 13,
                        );
                      } else {
                        return TextStyleCollection.subtitle.copyWith(
                          color: ColorCollection.offWhite,
                          fontSize: 13,
                        );
                      }
                    },
                  ),
                ),
                child: NavigationBar(
                  backgroundColor: ColorCollection.background,
                  selectedIndex: bottomNavbarController.selectedIndex.value,
                  onDestinationSelected: (index) {
                    bottomNavbarController.getInitialIndex(index: index);
                  },
                  shadowColor: ColorCollection.offWhite.withOpacity(0.2),
                  indicatorColor: ColorCollection.lightBlue,
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.home,
                        color: ColorCollection.lightBlue,
                      ),
                      label: 'Home',
                      selectedIcon: Icon(
                        Icons.home,
                        color: ColorCollection.offWhite,
                      ),
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.person,
                        color: ColorCollection.lightBlue,
                      ),
                      label: 'Profile',
                      selectedIcon: Icon(
                        Icons.person,
                        color: ColorCollection.offWhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
