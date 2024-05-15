import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/utils/methods/methods.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartProducts = {}.obs;
  String key = 'Cart_Products';

  void setToCart({required ProductModel product}) {
    if (cartProducts.containsKey(product)) {
      cartProducts[product] += 1;
    } else {
      cartProducts[product] = 1;
    }
    Get.snackbar(
      messageText: Center(
        child: CustomTextWidget(
          text: 'done',
          fontSize: 15,
          color: Get.isDarkMode ? AppColors.darkGreyClr : Colors.white,
        ),
      ),
      titleText: Center(
        child: CustomTextWidget(
          text: 'product added to cart',
          color: Get.isDarkMode ? AppColors.darkGreyClr : Colors.white,
          fontSize: 15,
        ),
      ),
      borderWidth: 20,
      'product added',
      'done',
      backgroundColor: AppColors.mainColor.withOpacity(0.6),
      borderRadius: 20,
      colorText: Get.isDarkMode ? AppColors.darkGreyClr : Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(bottom: 5, left: 30, right: 30),
    );
  }

  void removeProductFromCart({required ProductModel product}) {
    if (cartProducts.containsKey(product) && cartProducts[product] == 1) {
      cartProducts.removeWhere((key, value) => key == product);
      update();
    } else {
      cartProducts[product] -= 1;
      update();
    }
  }

  void removeItemFromCart({required ProductModel product}) {
    cartProducts.removeWhere((key, value) => key == product);
    update();
  }

  void removeAllProducts() {
    Methods.showOptions(
        color: Get.isDarkMode ? AppColors.darkGreyClr : Colors.white,
        title: 'Delete All Products',
        quesText: 'Are you sure ?',
        onPressed: () {
          cartProducts.clear();
          Get.back();
        });

    update();
  }

  get totalProductsCost => cartProducts.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(3);
  get totalItemsCost =>
      cartProducts.entries.map((e) => e.key.price * e.value).toList();
}
