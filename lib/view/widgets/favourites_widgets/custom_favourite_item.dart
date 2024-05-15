import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavouriteItem extends StatelessWidget {
  CustomFavouriteItem({super.key, required this.index});
  final controller = Get.find<ProductsController>();
  final int index;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final Color xColor = Theme.of(context).cardColor;
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.productDetailsPage,
        arguments: controller.allProducts[index],
      ),
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
          color: AppColors.kCOlor4,
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
                  controller.favouirteProducts[index].image,
                  fit: BoxFit.fill,
                  height: MediaQuery.sizeOf(context).width * 0.3,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.02,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextWidget(
                    text: controller.favouirteProducts[index].title,
                    color: color,
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
                  ),
                  CustomTextWidget(
                    text: controller.favouirteProducts[index].description,
                    color: color,
                    fontSize: MediaQuery.sizeOf(context).width * 0.03,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setInFavouirtesList(
                    productId: controller.favouirteProducts[index].id);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
