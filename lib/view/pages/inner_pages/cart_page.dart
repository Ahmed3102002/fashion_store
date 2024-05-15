import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/cart_widgets/custom_cart_item.dart';
import 'package:fashion_store/view/widgets/cart_widgets/custom_total_cost.dart';
import 'package:fashion_store/view/widgets/cart_widgets/empty_cart.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  static const routeName = '/cart_page';
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const CustomTextWidget(
              text: 'Cart',
              color: AppColors.mainColor,
            ),
            actions: [
              IconButton(
                onPressed: () async => controller.removeAllProducts(),
                icon: const Icon(Icons.delete_outline_outlined),
              ),
            ],
          ),
          body: Obx(() {
            return controller.cartProducts.isNotEmpty
                ? ListView(children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.78,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.cartProducts.length,
                          itemBuilder: (context, index) {
                            return CustomCartItem(index: index);
                          }),
                    ),
                    CustomTotalCost(),
                  ])
                : const EmptyCart();
          })),
      //,
    );
  }
}
