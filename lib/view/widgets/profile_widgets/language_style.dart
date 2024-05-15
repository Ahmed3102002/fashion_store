import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class LanguageStyle extends StatelessWidget {
  const LanguageStyle({
    super.key,
    required this.languageName,
    required this.languageImage,
  });

  final String languageName;
  final String languageImage;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextWidget(text: languageName),
        CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.mainColor,
          ),
          imageUrl: languageImage,
          width: size * 0.08,
          height: size * 0.08,
        ),
      ],
    );
  }
}
