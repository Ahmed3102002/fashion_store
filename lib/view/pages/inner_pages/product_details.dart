import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/cart_button.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/product_details_widgets/product_description.dart';
import 'package:fashion_store/view/widgets/product_details_widgets/product_details_image.dart';
import 'package:fashion_store/view/widgets/product_details_widgets/product_price_and_to_cart.dart';
import 'package:fashion_store/view/widgets/product_details_widgets/product_rating.dart';
import 'package:fashion_store/view/widgets/product_details_widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key});
  static const routeName = '/product_details_page';
  final productController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: color,
          title: CustomTextWidget(
            text: product.title,
            color: AppColors.mainColor,
          ),
          actions: [
            CartButton(),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: [
            ProductDetailsImage(imageUrl: product.image),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.01,
            ),
            ProductTitle(product: product),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.01,
            ),
            ProductRating(product: product),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.03,
            ),
            ProductDescription(product: product),
            SizedBox(
              height: MediaQuery.sizeOf(context).width * 0.03,
            ),
            ProductPriceAndToCart(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
