import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartItem extends StatelessWidget {
  CustomCartItem({super.key, required this.index});
  final controller = Get.find<CartController>();
  final int index;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final Color xColor = Theme.of(context).cardColor;
    ProductModel product = controller.cartProducts.keys.toList()[index];
    return Obx(() {
      return InkWell(
        onTap: () => Get.toNamed(Routes.productDetailsPage, arguments: product),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: xColor.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
            color: AppColors.mainColor.withOpacity(0.6),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    product.image, // Corrected
                    fit: BoxFit.fill,
                    height:
                        MediaQuery.of(context).size.width * 0.3, // Corrected
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02, // Corrected
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextWidget(
                      text: product.title, // Corrected
                      color: color,
                      fontSize:
                          MediaQuery.of(context).size.width * 0.04, // Corrected
                    ),
                    CustomTextWidget(
                      text: controller.totalItemsCost[index].toString(),
                      color: color,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            controller.removeProductFromCart(product: product),
                        icon: Icon(
                          Icons.remove_circle,
                          color: color,
                        ),
                      ),
                      CustomTextWidget(
                        text: controller.cartProducts.values
                            .toList()[index]
                            .toString(),
                        color: color,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      IconButton(
                        onPressed: () => controller.setToCart(product: product),
                        icon: Icon(
                          Icons.add_circle,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: IconButton(
                      onPressed: () =>
                          controller.removeItemFromCart(product: product),
                      icon: Icon(
                        Icons.delete_outline,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
