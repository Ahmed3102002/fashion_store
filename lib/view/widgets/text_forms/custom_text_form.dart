import 'package:fashion_store/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    this.obscureText = false,
    required this.hintText,
    required this.prefixIconData,
    this.suffixIconButton,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.nextFocusNode,
    this.fontSize = 20,
    this.contentPadding,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final IconData prefixIconData;
  final IconButton? suffixIconButton;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final double fontSize;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    return TextFormField(
      cursorColor: AppColors.mainColor,
      style: GoogleFonts.pridi(
        color: AppColors.mainColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted ??
          (value) {
            nextFocusNode == null
                ? FocusScope.of(context).requestFocus()
                : FocusScope.of(context).requestFocus(nextFocusNode);
          },
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        labelStyle: GoogleFonts.pridi(
          color: AppColors.mainColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: GoogleFonts.pridi(
          color: AppColors.mainColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        hintMaxLines: 1,
        prefixIcon: Icon(
          prefixIconData,
          color: AppColors.mainColor,
        ),
        suffixIcon: suffixIconButton,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.notiSettings),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.notiSettings),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
