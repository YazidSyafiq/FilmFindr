import 'package:filmfindr/constants/color_constant.dart';
import 'package:flutter/services.dart';

// Class untuk setup status bar
class StatusBarSetup {
  static void statusbar = SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorCollection.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
