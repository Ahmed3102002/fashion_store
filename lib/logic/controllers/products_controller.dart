import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/services/categories_services.dart';
import 'package:fashion_store/services/products_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductsController extends GetxController {
  int currentImageIndex = 0;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> searchList = <ProductModel>[].obs;
  final isLoading = false.obs;
  RxList<ProductModel> favouirteProducts = <ProductModel>[].obs;
  int get getCurrentImageIndex => currentImageIndex;
  final TextEditingController searchController = TextEditingController();

  void setCurrentImageIndex({required int index}) => currentImageIndex = index;
  String key = 'List_Of_Favouirtes_Products';
  var allCategories = <String>[].obs;
  var allCategoriesData = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    List? data = GetStorage().read<List>(
      key,
    );
    if (data != null) {
      favouirteProducts =
          data.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
    getCategories();
  }

  void getProducts() async {
    var products = await ProductsServices.getAllProducts();
    if (products.isNotEmpty) {
      try {
        isLoading(true);
        allProducts.addAll(products);
      } finally {
        isLoading(false);
      }
    }
  }

  void getCategories() async {
    var categories = await CategoriesServices.getCategories();
    if (categories.isNotEmpty) {
      try {
        isLoading(true);
        allCategories.addAll(categories);
      } finally {
        isLoading(false);
      }
    }
  }

  Future<void> getAllCategories({required String category}) async {
    var categories =
        await CategoriesServices.getAllCategories(category: category);
    if (categories.isNotEmpty) {
      try {
        isLoading(true);
        allCategoriesData.addAll(categories);
      } finally {
        isLoading(false);
      }
    }
  }

  void clearCategoriesList() {
    allCategoriesData.clear();
    update();
  }

  void setInFavouirtesList({required int productId}) {
    if (favouirteProducts.any((element) => element.id == productId)) {
      favouirteProducts.removeWhere((element) => element.id == productId);
      GetStorage().write(key, favouirteProducts);
    } else {
      favouirteProducts.add(
        allProducts.firstWhere((element) => element.id == productId),
      );
      GetStorage().write(key, favouirteProducts);
    }
  }

  bool getIsFavouirte({required int productId}) {
    return favouirteProducts.any((element) => element.id == productId);
  }

  void addToSeachList({required String searchTitle}) {
    searchList = allProducts
        .where((product) => product.title.toLowerCase().contains(searchTitle))
        .toList()
        .obs;
    update();
  }

  void clearSeachList() {
    searchController.clear();
    searchList.clear();
    update();
  }
}
