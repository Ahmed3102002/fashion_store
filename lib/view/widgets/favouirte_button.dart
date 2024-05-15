import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouirteButton extends StatelessWidget {
  FavouirteButton({
    super.key,
    required this.product,
  });

  final productController = Get.find<ProductsController>();
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IconButton(
        onPressed: () async {
          productController.setInFavouirtesList(
            productId: product.id,
          );
        },
        icon: Icon(
          productController.getIsFavouirte(
            productId: product.id,
          )
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          size: MediaQuery.sizeOf(context).width * 0.05,
          color: Colors.red,
        ),
      );
    });
  }
}
