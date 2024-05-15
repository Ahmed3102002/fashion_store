import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartButton extends StatelessWidget {
  CartButton({super.key, this.isHome = false, this.iconColor});
  final cartController = Get.find<CartController>();
  final bool isHome;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final Color defaultColor = Theme.of(context).cardColor;
    return Obx(() {
      return cartController.cartProducts.isEmpty
          ? Builder(builder: (context) {
              return IconButton(
                onPressed: () async => Get.toNamed(Routes.cartPage),
                icon: Icon(
                  Icons.shopping_cart_checkout,
                  color: isHome ? color : defaultColor,
                ),
              );
            })
          : Badge(
              offset: Offset.fromDirection(90, 3),
              backgroundColor: AppColors.notiSettings,
              label: CustomTextWidget(
                color: color,
                fontSize: 12,
                text: cartController.cartProducts.values
                    .toList()
                    .reduce((value, element) => value + element)
                    .toString(),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () async => Get.toNamed(Routes.cartPage),
                  icon: Icon(
                    Icons.shopping_cart_checkout,
                    color: iconColor ?? defaultColor,
                  ),
                ),
              ),
            );
    });
  }
}
