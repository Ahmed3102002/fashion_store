import 'package:fashion_store/view/pages/main_pages/categories_page.dart';
import 'package:fashion_store/view/pages/main_pages/favourites_page.dart';
import 'package:fashion_store/view/pages/main_pages/home_page.dart';
import 'package:fashion_store/view/pages/main_pages/profile_page.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final pages = [
    const HomePage(),
    CategoriesPage(),
    FavouritesPage(),
    ProfilePage(),
  ].obs;
  final titles = [
    'Fashion Store',
    'Categories',
    'Favouirtes',
    'Profile',
  ].obs;
}
