import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/loading_widget.dart';
import 'package:fashion_store/view/widgets/show_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({
    super.key,
  });
  static const routeName = '/category_page';
  final productController = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    final String categoryName =
        ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              productController.clearCategoriesList();
              Get.back();
            },
          ),
          title: CustomTextWidget(
            text: categoryName,
            color: AppColors.mainColor,
          ),
          centerTitle: true,
        ),
        body: productController.isLoading.value
            ? const Loading()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ShowProducts(
                  products: productController.allCategoriesData,
                ),
              ),
      ),
    );
  }
}
