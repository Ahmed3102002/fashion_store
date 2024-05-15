import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/auth_widgets/custom_auth_button.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/heart.png',
          height: MediaQuery.sizeOf(context).width * 0.6,
          width: double.infinity,
        ),
        const CustomTextWidget(
          text: 'Your cart is empty',
          color: AppColors.mainColor,
        ),
        CustomButtons(title: 'Let`s Beging', onPressed: () => Get.back())
      ],
    );
  }
}
