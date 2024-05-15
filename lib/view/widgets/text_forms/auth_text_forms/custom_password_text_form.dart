import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/validations/validator_methods.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/text_forms/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.authController,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (context) {
      return CustomTextForm(
        controller: passwordController,
        focusNode: passwordFocusNode,
        keyboardType: TextInputType.visiblePassword,
        hintText: 'Enter your password',
        prefixIconData: Icons.lock_outline,
        obscureText: authController.getIsVisiable,
        validator: ValidatorMethods.validationOfPassword,
        suffixIconButton: IconButton(
          onPressed: () => authController.setIsVisible,
          icon: Icon(
            authController.getIsVisiable
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.mainColor,
          ),
        ),
      );
    });
  }
}
