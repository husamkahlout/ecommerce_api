import 'package:dio/dio.dart';
import 'package:ecommerce_api/e_commerce_app/models/post_request.dart';
import 'dart:developer';
import 'package:ecommerce_api/e_commerce_app/models/product.dart';

class DioHelper {
  DioHelper._();
  static DioHelper dioHelper = DioHelper._();
  Dio dioInstance = Dio();
  //================================= Products ==================================
  Future<List<Product>> getAllProducts() async {
    Response productsResponse =
        await dioInstance.get('https://fakestoreapi.com/products');
    List productsList = productsResponse.data;
    // convert list of maps to list of products
    List<Product> products = productsList.map((e) {
      return Product.fromJson(e);
    }).toList();

    return products;
  }

  Future<List<Product>> getCategoryProducts(String category) async {
    Response productsResponse = await dioInstance
        .get('https://fakestoreapi.com/products/category/$category');
    List productsList = productsResponse.data;
    // convert list of maps to list of products
    List<Product> categoryProducts = productsList.map((e) {
      log(e.toString());
      return Product.fromJson(e);
    }).toList();

    return categoryProducts;
  }

  getSingleProduct(int id) async {
    Response singleProductResponse =
        await dioInstance.get("https://fakestoreapi.com/products/$id");
    return Product.fromJson(singleProductResponse.data);
  }

  //================================= Categories ================================
  Future<List<String>> getAllCategories() async {
    Response categoriesResponse =
        await dioInstance.get('https://fakestoreapi.com/products/categories');
    List categoriesList = categoriesResponse.data;
    // convert list of dynamic to list of strings
    List<String> categories = categoriesList.map((e) => e.toString()).toList();
    log(categories.toString());
    return categories;
  }

  //================================= social media posts ================================
  /* when post data to server 
  we use *data:* for body request
  and use *queryParameters:* for params request 
  */
  createNewPost(PostRequest postRequest) async {
    Response response = await dioInstance.post(
      "https://jsonplaceholder.typicode.com/posts",
      data: postRequest.toJson(), 
    );
    log(response.data.toString());
    log(response.statusCode.toString());
  }
}
