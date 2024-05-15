import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AuthQuestion extends StatelessWidget {
  const AuthQuestion({
    super.key,
    required this.question,
    required this.page,
    this.color = AppColors.mainColor,
    this.fontSize = 25,
    required this.pageTitle,
  });
  final String question;
  final String page;
  final String pageTitle;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: question,
          color: color,
          fontSize: fontSize,
        ),
        TextButton(
          onPressed: () => Get.offNamed(page),
          child: CustomTextWidget(
            text: pageTitle,
            color: color,
            fontSize: fontSize,
            textDecoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
