import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Views {
  Widget setTextView(String text, double fontSize, bool boldFlag) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: boldFlag ? FontWeight.bold : null,
      ),
    );
  }

  Widget setImageView(String fileName, double imgWidth, double imgHeight, bool fitFlag) {
    return Image.asset(
      fileName,
      width: imgWidth,
      height: imgHeight,
      fit: fitFlag ? BoxFit.cover : null,
    );
  }
}
