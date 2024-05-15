import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_auth_button.dart';
import 'package:fashion_store/view/pages/auth_pages/custom_auth_page.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/text_forms/auth_text_forms/custom_email_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  static const routeName = '/forget_password_page';

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Color color = Theme.of(context).scaffoldBackgroundColor;

    return CustomAuthPage(
      formKey: formKey,
      appBar: AppBar(
        foregroundColor: AppColors.mainColor,
      ),
      childern: [
        CustomTextWidget(
          text: 'FORGET PASSWORD',
          fontSize: 30,
          color: color,
        ),
        Lottie.asset(
          'assets/images/forget_password.json',
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        EmailTextForm(
            emailController: emailController, emailFocusNode: emailFocusNode),
        SizedBox(
          height: size.height * 0.04,
        ),
        GetBuilder<AuthController>(builder: (context) {
          return CustomButtons(
            colorButton: color,
            textColor: AppColors.mainColor,
            title: 'SEND',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                try {
                  authController.sendPasswordRestEmail(
                      email: emailController.text.trim());
                } catch (error) {
                  Get.snackbar(
                    snackPosition: SnackPosition.BOTTOM,
                    error.toString(),
                    error.toString(),
                    backgroundColor: AppColors.mainColor,
                    colorText: Colors.white,
                    borderRadius: 20,
                  );
                }
              }
            },
          );
        }),
      ],
    );
  }
}
