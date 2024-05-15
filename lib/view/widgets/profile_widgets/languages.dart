import 'package:fashion_store/logic/controllers/profile_controller.dart';
import 'package:fashion_store/utils/costant_values.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/profile_widgets/language_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends StatelessWidget {
  Languages({
    super.key,
  });
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context).width;
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 15),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: AppColors.languageSettings),
        child: const Icon(
          Icons.language_outlined,
        ),
      ),
      title: const CustomTextWidget(text: 'Languages'),
      trailing: Container(
        width: size * 0.38,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.notiSettings),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            items: const [
              DropdownMenuItem(
                value: ConstantValues.englishValue,
                child: LanguageStyle(
                  languageImage: ConstantValues.englishImage,
                  languageName: 'English ',
                ),
              ),
              DropdownMenuItem(
                value: ConstantValues.arabicValue,
                child: LanguageStyle(
                  languageImage: ConstantValues.arabicImage,
                  languageName: 'Arabic ',
                ),
              ),
              DropdownMenuItem(
                value: ConstantValues.frenchValue,
                child: LanguageStyle(
                  languageImage: ConstantValues.frenchImage,
                  languageName: 'French ',
                ),
              ),
            ],
            value: ConstantValues.englishValue,
            onChanged: (v) {},
          ),
        ),
      ),
    );
  }
}
