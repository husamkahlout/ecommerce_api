// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:ecommerce_api/e_commerce_app/providers/dio_provider.dart';
import 'package:ecommerce_api/e_commerce_app/router/router.dart';
import 'package:ecommerce_api/e_commerce_app/views/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Home Page"),),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.07),
        ),
        child: Consumer<DioProvider>(builder: (context, dioProvider, x) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //============================ Title and search icon =======================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.search_rounded,
                      size: 26,
                    ),
                  ),
                ],
              ),
              //============================ Categories ===================================
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Choose category",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              dioProvider.categories == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: (() => dioProvider.selectCategory("all")),
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 7),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  color: dioProvider.selectedCategory == "all"
                                      ? Colors.amberAccent
                                      : Color.fromARGB(255, 221, 223, 226),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "all",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: dioProvider.categories!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (() => dioProvider.selectCategory(
                                        dioProvider.categories![index])),
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 7),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: dioProvider.selectedCategory ==
                                                dioProvider.categories![index]
                                            ? Colors.amberAccent
                                            : Color.fromARGB(
                                                255, 221, 223, 226),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        dioProvider.categories![index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: dioProvider.products == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: dioProvider.products?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              dioProvider.getSingleProduct(
                                  dioProvider.products![index].id!);
                              AppRouter.navigateToWidget(ProductDetails());
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                        dioProvider.products![index].image!,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            child: Text(
                                          dioProvider.products![index].title!,
                                          maxLines: 1,
                                        )),
                                        SizedBox(
                                            child: Text(
                                          dioProvider
                                              .products![index].description!,
                                          maxLines: 1,
                                        )),
                                        SizedBox(
                                            child: Text(dioProvider
                                                .products![index].price!
                                                .toString())),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
