import 'package:fashion_store/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class ConstantValues {
  static List<BottomNavigationBarItem> pages = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: '',
      activeIcon: Icon(
        Icons.home,
        color: AppColors.mainColor,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.category_outlined,
      ),
      label: '',
      activeIcon: Icon(
        Icons.category,
        color: AppColors.mainColor,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_outline,
      ),
      label: '',
      activeIcon: Icon(
        Icons.favorite,
        color: AppColors.mainColor,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_basket_outlined,
      ),
      label: '',
      activeIcon: Icon(
        Icons.shopping_basket,
        color: AppColors.mainColor,
      ),
    ),
  ];

  static const String apiLink = 'https://fakestoreapi.com';
  static const String englishValue = 'eng';
  static const String arabicValue = 'arb';
  static const String frenchValue = 'fre';
  static const String englishImage =
      'https://flagpedia.net/data/flags/emoji/apple/160x160/us.png';
  static const String arabicImage =
      'https://flagpedia.net/data/flags/emoji/apple/160x160/eg.png';
  static const String frenchImage =
      'https://flagpedia.net/data/flags/emoji/apple/160x160/fr.png';
}
