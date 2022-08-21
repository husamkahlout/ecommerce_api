import 'package:dio/dio.dart';
import 'dart:developer';

import 'package:ecommerce_api/models/product.dart';

class DioHelper {
  DioHelper._();
  static DioHelper dioHelper = DioHelper._();
  Dio dio = Dio();
  //================================= Products ==================================
  Future<List<Product>> getAllProducts() async {
    Response productsResponse =
        await dio.get('https://fakestoreapi.com/products');
    List responseList = productsResponse.data;
    List<Product> products = responseList.map((e) {
      // log(e.toString());
      return Product.fromJson(e);
    }).toList();

    return products;
  }

  //================================= Categories ================================
  getAllCategories() async {
    Response categoriesResponse =
        await dio.get('https://fakestoreapi.com/products/categories');
    List cats = categoriesResponse.data;
    List<String> categories = cats.map((e) => e.toString()).toList();
    log(categories.length.toString());
    log(categories.toString());
    return categories;
  }
}
