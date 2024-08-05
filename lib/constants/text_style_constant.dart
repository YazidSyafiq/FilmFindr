// Class TextStyle untuk menampung style teks yang digunakan dalam aplikasi
import 'package:filmfindr/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleCollection {
  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 14,
    color: ColorCollection.offWhite,
    fontWeight: FontWeight.normal,
  );

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 18,
    color: ColorCollection.red,
    fontWeight: FontWeight.bold,
  );
}
