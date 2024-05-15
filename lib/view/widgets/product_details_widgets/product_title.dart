import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/favouirte_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTitle extends StatelessWidget {
  ProductTitle({
    super.key,
    required this.product,
  });

  final ProductModel product;
  final productController = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CustomTextWidget(text: product.title),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: FavouirteButton(
            product: product,
          ),
        ),
      ],
    );
  }
}
