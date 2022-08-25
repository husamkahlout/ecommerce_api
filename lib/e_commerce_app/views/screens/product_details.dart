import 'package:ecommerce_api/e_commerce_app/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(
      builder: (context, dioProvider, x) {
        return Scaffold(
          appBar: AppBar(title: Text(dioProvider.selectedProduct?.title ?? "Loading ...")),
          body: 
          dioProvider.selectedProduct ==null ? const Center(child: CircularProgressIndicator(),) :
          Container(
    padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(dioProvider.selectedProduct!.image!, fit: BoxFit.cover,),
          ),
          Text(dioProvider.selectedProduct!.title ?? "", ),
          Text(dioProvider.selectedProduct!.description ?? ""),
          Text(dioProvider.selectedProduct!.price.toString()),
        ],
      ),
    ),
  ),
        );
      });
  }

}
