import 'package:ecommerce_api/data/dio_helper.dart';
import 'package:ecommerce_api/models/product.dart';
import 'package:flutter/material.dart';

class DioProvider extends ChangeNotifier {
  DioProvider() {
    getAllProducts();
    getAllCategoris();
  }
  List<Product>? products;
  List<String>? categories;

  getAllProducts() async {
    products = await DioHelper.dioHelper.getAllProducts();
    notifyListeners();
  }

  getAllCategoris() async {
    categories = await DioHelper.dioHelper.getAllCategories();
    notifyListeners();
  }
}
