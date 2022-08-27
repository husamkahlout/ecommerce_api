import 'dart:developer';

import 'package:ecommerce_api/airlines_app/data/sp_helper.dart';
import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';
import 'package:ecommerce_api/airlines_app/providers/airlines_dio_provider.dart';
import 'package:ecommerce_api/airlines_app/router/router.dart';
import 'package:ecommerce_api/airlines_app/views/screens/login_screen.dart';
import 'package:ecommerce_api/airlines_app/views/widgets/passenger_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class PassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AirLinesProvider>(builder: (context, airLineProvider, x) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Passengers"),
          actions: [
            IconButton(
                onPressed: () {
                  airLineProvider.logOut();
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: airLineProvider.passengers.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        airLineProvider.getMorePassegngers();
                        log(airLineProvider.passengers.length.toString());
                      },
                      child: ListView.builder(
                        itemCount: airLineProvider.isLoading
                            ? airLineProvider.passengers.length + 1
                            : airLineProvider.passengers.length,
                        itemBuilder: (context, index) {
                          if (index == airLineProvider.passengers.length) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return PassengerWidget(
                              airLineProvider.passengers[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
