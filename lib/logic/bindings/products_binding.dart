import 'package:fashion_store/logic/controllers/cart_controller.dart';
import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:get/get.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.lazyPut(() => CartController());
  }
}
