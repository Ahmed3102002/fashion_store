import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    this.colorButton = AppColors.mainColor,
    this.textColor = Colors.white,
    required this.title,
    required this.onPressed,
    this.margin,
    this.elevation = 0,
  });

  final Color colorButton;
  final Color textColor;
  final String title;
  final Function() onPressed;
  final EdgeInsetsGeometry? margin;
  final int elevation;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        width: size.width * 0.4,
        height: size.width * 0.17,
        margin: margin,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: colorButton,
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            elevation: 0,
            backgroundColor: colorButton,
          ),
          onPressed: onPressed,
          child: CustomTextWidget(
            text: title,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
