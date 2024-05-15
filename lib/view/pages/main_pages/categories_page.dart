import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:fashion_store/view/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  static const routeName = '/categories_page';
  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Loading();
          } else {
            return ListView.separated(
              padding: EdgeInsets.all(
                size * 0.015,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.getAllCategories(
                      category: controller.allCategories[index].toString());
                  Get.toNamed(Routes.categoryPage,
                      arguments: controller.allCategories[index].toString());
                },
                child: Container(
                  height: size * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://tse1.mm.bing.net/th?id=OIP.GPFEY6kfgxbsja6gmrW6rwHaE7&pid=Api',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: CustomTextWidget(
                      text: controller.allCategories[index].toString(),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: size * 0.015,
              ),
              itemCount: controller.allCategories.length,
            );
          }
        }),
      ),
    );
  }
}
