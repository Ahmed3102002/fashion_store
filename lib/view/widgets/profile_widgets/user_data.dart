import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/logic/controllers/profile_controller.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserData extends StatelessWidget {
  UserData({
    super.key,
  });
  final controller = Get.find<ProfileController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListTile(
        title: CustomTextWidget(
          text:
              controller.profileName(name: authController.userInfo.value.name),
        ),
        subtitle: CustomTextWidget(
          text: authController.userInfo.value.email,
          fontSize: 18,
        ),
      );
    });
  }
}
