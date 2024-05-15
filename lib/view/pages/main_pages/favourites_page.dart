import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/favourites_widgets/custom_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavouritesPage extends StatelessWidget {
  FavouritesPage({super.key});
  static const routeName = '/favourites_page';
  final controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            return controller.favouirteProducts.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.favouirteProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomFavouriteItem(
                        index: index,
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset('assets/images/no_data.json'),
                      const CustomTextWidget(
                        text: 'Please, add products to favourites',
                        color: AppColors.mainColor,
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
