import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/show_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategories extends StatelessWidget {
  CustomCategories({
    super.key,
  });
  final productController = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircularProgressIndicator(
              color: AppColors.mainColor,
            )
          ],
        );
      } else {
        return ShowProducts(
          products: productController.searchList.isNotEmpty
              ? productController.searchList
              : productController.allProducts,
        );
      }
    });
  }
}
