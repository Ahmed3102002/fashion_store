import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isDark = false.obs;
  String profileName({required String name}) {
    return name.split(' ').map((e) => e.capitalize).join(' ');
  }
}
