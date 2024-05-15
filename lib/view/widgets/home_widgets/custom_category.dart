import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/favouirte_button.dart';
import 'package:fashion_store/view/widgets/home_widgets/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategory extends StatelessWidget {
  CustomCategory({
    super.key,
    required this.product,
  });
  final productController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final Color xColor = Theme.of(context).cardColor;
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.productDetailsPage,
        arguments: product,
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: xColor.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FavouirteButton(
                  product: product,
                ),
                Expanded(
                  child: CustomTextWidget(
                    text: product.title.toString(),
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                AddToCartButton(product: product),
              ],
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppColors.mainColor,
                ),
                imageUrl: product.image,
                height: MediaQuery.sizeOf(context).width * 0.5,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextWidget(
                  text: product.price.toString(),
                  fontSize: MediaQuery.sizeOf(context).width * 0.05,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextWidget(
                        text: product.rating.rate.toString(),
                        fontSize: MediaQuery.sizeOf(context).width * 0.05,
                        color: color,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
