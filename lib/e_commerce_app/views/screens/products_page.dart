import 'package:ecommerce_api/e_commerce_app/data/dio_helper.dart';
import 'package:ecommerce_api/e_commerce_app/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DioProvider>(builder: (context, dioProvider, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            DioHelper.dioHelper.getAllCategories();
          },
          child: const Icon(Icons.add),
        ),
        // appBar: AppBar(
        //   title: Text('Products'),
        //   centerTitle: true,
        // ),
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dioProvider.categories?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      dioProvider.selectCategory(dioProvider.categories![index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                        // width: 50,
                        // height: 10,
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 2,
                                color: dioProvider.categories![index] == dioProvider.selectedCategory
                                    ? Colors.red
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          child: Text(
                            dioProvider.categories![index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );

                  // return (
                  //   children: [
                  //     const SizedBox(
                  //       height: 10,
                  //     ),

                  //     SizedBox(
                  //       height: 150,
                  //       width: double.infinity,
                  //       child:
                  //           Image.network(dioProvider.products?[index].image ?? ''),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Text(dioProvider.products?[index].title ?? ''),
                  //   ],
                  // );
                }),
          ),
        ),
      );
    });
  }
}
