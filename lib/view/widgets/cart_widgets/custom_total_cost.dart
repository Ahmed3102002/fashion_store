import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTotalCost extends StatelessWidget {
  CustomTotalCost({super.key});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;

    return Obx(() {
      return Container(
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextWidget(
                  text:
                      'Total Cost of ${controller.cartProducts.values.toList().reduce((value, element) => value + element)} items',
                  fontSize: MediaQuery.sizeOf(context).width * 0.042,
                ),
                CustomTextWidget(
                  text: '\$ ${controller.totalProductsCost}',
                  fontSize: MediaQuery.sizeOf(context).width * 0.042,
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.01,
            ),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: AppColors.mainColor.withOpacity(0.7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_checkout,
                  color: color,
                ),
                label: CustomTextWidget(
                  text: 'Check Out',
                  color: color,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
