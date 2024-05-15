import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/logic/controllers/main_cotroller.dart';
import 'package:fashion_store/utils/costant_values.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/view/widgets/cart_button.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const routeName = '/main_page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Get.find<MainController>();

  final authController = Get.find<AuthController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;
    final Color secondColor = Theme.of(context).cardColor;

    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: controller.currentIndex.value != 0
                  ? color
                  : AppColors.mainColor,
              centerTitle: true,
              title: CustomTextWidget(
                text: controller.titles[controller.currentIndex.value],
                fontSize: 25,
                color: controller.currentIndex.value == 0
                    ? color
                    : AppColors.mainColor,
              ),
              actions: [
                CartButton(
                  isHome: controller.currentIndex.value != 0 ? false : true,
                  iconColor:
                      controller.currentIndex.value != 0 ? secondColor : color,
                ),
              ],
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: color,
              currentIndex: controller.currentIndex.value,
              items: ConstantValues.pages,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
          );
        },
      ),
    );
  }
}
