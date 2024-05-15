import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductPriceAndToCart extends StatelessWidget {
  ProductPriceAndToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CustomTextWidget(
              text: 'price ',
              fontSize: MediaQuery.sizeOf(context).width * 0.035,
              color: AppColors.notiSettings,
            ),
            CustomTextWidget(
              text: '\$ ${product.price}   ',
              fontSize: MediaQuery.sizeOf(context).width * 0.045,
            ),
          ],
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              cartController.setToCart(product: product);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: 'Add To Cart  ',
                  color: color,
                ),
                Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: color,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
