import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/products_controller.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({
    super.key,
    required this.product,
  });

  final productController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        cartController.setToCart(product: product);
      },
      icon: const Icon(
        Icons.shopping_cart_checkout_outlined,
      ),
    );
  }
}
