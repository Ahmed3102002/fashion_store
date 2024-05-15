import 'package:fashion_store/logic/controllers/profile_controller.dart';
import 'package:fashion_store/logic/controllers/themes_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemesButton extends StatelessWidget {
  ThemesButton({
    super.key,
  });
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: AppColors.darkSettings),
          child: Icon(
            controller.isDark.value
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
        ),
        title: CustomTextWidget(
          text: '${controller.isDark.value ? 'Dark' : 'Light'} Mode',
        ),
        trailing: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Switch(
              activeTrackColor: AppColors.mainColor,
              activeColor: AppColors.mainColor,
              value: controller.isDark.value,
              onChanged: (value) {
                ThemesController().chanageThemeMode;
                controller.isDark.value = value;
              }),
        ),
      );
    });
  }
}
