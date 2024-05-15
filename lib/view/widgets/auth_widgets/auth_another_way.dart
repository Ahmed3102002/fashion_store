import 'package:auth_buttons/auth_buttons.dart';
import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthAnotherWay extends StatelessWidget {
   AuthAnotherWay({
    super.key,
  });
final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<AuthController>(
          builder: (context) {
            return GoogleAuthButton(
              onPressed: () async{
                authController.logInWithGoogle;
              },
              style: const AuthButtonStyle(
                borderRadius: 20,
                buttonType: AuthButtonType.icon,
              ),
            );
          }
        ),
        SizedBox(
          width: size.width * 0.2,
        ),
        FacebookAuthButton(
          onPressed: () {},
          style: const AuthButtonStyle(
            borderRadius: 20,
            buttonType: AuthButtonType.icon,
          ),
        ),
      ],
    );
  }
}
