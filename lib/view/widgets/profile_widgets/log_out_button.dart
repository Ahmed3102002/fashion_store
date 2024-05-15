import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/logic/controllers/main_cotroller.dart';
import 'package:fashion_store/utils/methods/methods.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutButton extends StatelessWidget {
  LogOutButton({
    super.key,
  });

  final controller = Get.find<MainController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;

    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 20),
      onTap: () async {
        Methods.showOptions(
            color: color,
            title: 'Logout',
            quesText: 'Are you sure you want to log out?',
            onPressed: () => authController.logOutToFirebase());
      },
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: AppColors.logOutSettings),
        child: const Icon(
          Icons.logout,
        ),
      ),
      title: const CustomTextWidget(text: 'Log Out'),
      trailing: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
      ),
    );
  }
}
