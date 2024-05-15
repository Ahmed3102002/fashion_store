import 'package:fashion_store/logic/bindings/auth_binding.dart';
import 'package:fashion_store/logic/bindings/cart_binding.dart';
import 'package:fashion_store/logic/bindings/main_binding.dart';
import 'package:fashion_store/logic/bindings/products_binding.dart';
import 'package:fashion_store/routes/routes.dart';
import 'package:fashion_store/view/pages/auth_pages/forget_password_page.dart';
import 'package:fashion_store/view/pages/auth_pages/log_in_page.dart';
import 'package:fashion_store/view/pages/auth_pages/sign_up_page.dart';
import 'package:fashion_store/view/pages/inner_pages/cart_page.dart';
import 'package:fashion_store/view/pages/inner_pages/category_page.dart';
import 'package:fashion_store/view/pages/main_pages/categories_page.dart';
import 'package:fashion_store/view/pages/main_pages/favourites_page.dart';
import 'package:fashion_store/view/pages/main_pages/home_page.dart';
import 'package:fashion_store/view/pages/main_pages/main_page.dart';
import 'package:fashion_store/view/pages/main_pages/profile_page.dart';
import 'package:fashion_store/view/pages/inner_pages/product_details.dart';
import 'package:fashion_store/view/pages/inner_pages/welcome_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const String initialRoute = Routes.welcomPage;
  static final List<GetPage<dynamic>> getPages = [
    GetPage(
      name: Routes.logInPage,
      page: () => const LogInPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpPage,
      page: () => const SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordPage,
      page: () => const ForgetPasswordPage(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.welcomPage, page: () => const WelcomePage()),
    GetPage(
      name: Routes.mainPage,
      page: () => MainPage(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductsBinding(),
      ],
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.categoriesPage,
      page: () => CategoriesPage(),
      binding: ProductsBinding(),
    ),
    GetPage(name: Routes.favouritesPage, page: () => FavouritesPage()),
    GetPage(name: Routes.profilePage, page: () => ProfilePage()),
    GetPage(
      name: Routes.cartPage,
      page: () => CartPage(),
      bindings: [ProductsBinding(), CartBinding()],
    ),
    GetPage(
      name: Routes.productDetailsPage,
      page: () => ProductDetailsPage(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: Routes.categoryPage,
      page: () => CategoryPage(),
      binding: ProductsBinding(),
    ),
  ];
}
