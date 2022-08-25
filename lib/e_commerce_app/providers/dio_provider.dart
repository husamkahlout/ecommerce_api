import 'package:ecommerce_api/e_commerce_app/data/dio_helper.dart';
import 'package:ecommerce_api/e_commerce_app/models/post_request.dart';
import 'package:ecommerce_api/e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class DioProvider extends ChangeNotifier {
  DioProvider() {
    getAllCategoris();
    getAllProducts();
  }
  List<Product>? products;
  List<String>? categories;
  Product? selectedProduct;
  String selectedCategory = "all";
  selectCategory(String category) {
    selectedCategory = category;
    products = null; // make the products empty after changed the category
    notifyListeners();
    if (category == "all") {
      getAllProducts();
    } else {
      getCategoryProducts();
    }
  }

//=========================== Products =================================

  getAllProducts() async {
    products = await DioHelper.dioHelper.getAllProducts();
    notifyListeners();
  }

  getCategoryProducts() async {
    products = await DioHelper.dioHelper.getCategoryProducts(selectedCategory);
    notifyListeners();
  }

  getSingleProduct(int id) async {
    selectedProduct == null;
    notifyListeners();
    selectedProduct = await DioHelper.dioHelper.getSingleProduct(id);
    notifyListeners();
  }

//=========================== Categories ===============================

  getAllCategoris() async {
    categories = await DioHelper.dioHelper.getAllCategories();
    notifyListeners();
  }

  
  createNewPost() async {
    PostRequest postRequest = PostRequest("Husam", "bodyHusam", 99);
    DioHelper.dioHelper.createNewPost(postRequest);
  }
}
