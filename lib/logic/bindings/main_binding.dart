import 'package:fashion_store/logic/controllers/main_cotroller.dart';
import 'package:fashion_store/logic/controllers/profile_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(ProfileController());
  }
}
