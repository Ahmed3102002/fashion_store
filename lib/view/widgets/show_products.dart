import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/view/widgets/home_widgets/custom_category.dart';
import 'package:fashion_store/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (products.isEmpty) {
        return const Loading();
      } else {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            childAspectRatio: 0.5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CustomCategory(
              product: products[index],
            );
          },
        );
      }
    });
  }
}
