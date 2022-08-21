import 'package:ecommerce_api/data/dio_helper.dart';
import 'package:ecommerce_api/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(builder: (context, dioProvider, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            DioHelper.dioHelper.getAllCategories();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Products'),
          centerTitle: true,
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: dioProvider.products?.length ?? 0,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      children: List.generate(dioProvider.categories?.length ?? 0,
                          (index) {
                    return Text(dioProvider.categories![index]);
                  })),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child:
                        Image.network(dioProvider.products?[index].image ?? ''),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(dioProvider.products?[index].title ?? ''),
                ],
              );
            }),
      );
    });
  }
}
