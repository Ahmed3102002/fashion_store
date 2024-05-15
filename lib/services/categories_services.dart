import 'package:dio/dio.dart';
import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/utils/costant_values.dart';

class CategoriesServices {
  static Future<List<String>> getCategories() async {
    try {
      final response =
          await Dio().get('${ConstantValues.apiLink}/products/categories');

      if (response.statusCode == 200) {
        // قم بتحويل البيانات إلى قائمة من السلاسل
        List<dynamic> responseData = response.data;
        List<String> categories =
            responseData.map((item) => item.toString()).toList();
        return categories;
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        throw Exception(
            'please, check your internet connection, or try again later');
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        throw Exception(
            'Sorry, the server isn\'t available right now, please try again later');
      } else {
        throw Exception('failed to get data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  static Future<List<ProductModel>> getAllCategories(
      {required String category}) async {
    try {
      final response = await Dio()
          .get('${ConstantValues.apiLink}/products/category/$category');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<dynamic> responseData = response.data;
        List<ProductModel> products =
            responseData.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
        throw Exception(
            'please, check your internet connection, or try again later');
      } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
        throw Exception(
            'Sorry, the server isn\'t available right now, please try again later');
      } else {
        throw Exception('failed to get data');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
