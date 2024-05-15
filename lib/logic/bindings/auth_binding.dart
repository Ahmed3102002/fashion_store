import 'package:fashion_store/logic/controllers/auth_controller.dart';
import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ProductsController());
  }
}
