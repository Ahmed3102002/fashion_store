import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Methods {
  static void showOptions({
    required Color color,
    required String title,
    required String quesText,
    required void Function() onPressed,
    String agreeText = 'Yes',
    String disagreeText = 'No',
  }) {
    Get.defaultDialog(
      backgroundColor: AppColors.mainColor,
      title: title,
      titleStyle: GoogleFonts.pridi(
        color: color,
        fontSize: 15,
        decorationColor: color,
        fontWeight: FontWeight.bold,
      ),
      middleText: quesText,
      middleTextStyle: GoogleFonts.pridi(
        color: color,
        fontSize: 15,
        decorationColor: color,
        fontWeight: FontWeight.bold,
      ),
      confirm: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: CustomTextWidget(
          text: 'Yes',
          fontSize: 15,
          color: color,
        ),
      ),
      cancel: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        onPressed: () => Get.back(),
        child: CustomTextWidget(
          text: 'No',
          color: color,
          fontSize: 15,
        ),
      ),
    );
  }
}
