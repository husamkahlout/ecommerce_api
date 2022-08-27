import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/airlines_app/data/airlines_dio_helper.dart';
import 'package:ecommerce_api/airlines_app/data/sp_helper.dart';
import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';
import 'package:ecommerce_api/airlines_app/router/router.dart';
import 'package:ecommerce_api/airlines_app/views/screens/login_screen.dart';
import 'package:ecommerce_api/airlines_app/views/screens/passenger_screen.dart';
import 'package:ecommerce_api/airlines_app/views/widgets/custom_dialog.dart';
import 'package:ecommerce_api/e_commerce_app/data/dio_helper.dart';
import 'package:flutter/material.dart';

class AirLinesProvider extends ChangeNotifier {
  AirLinesProvider() {
    if (SpHelper.spHelper.getToken() != null) {
      getPassengers();
    }
  }
  TextEditingController userNameController =
      TextEditingController(text: "api-user4@iwt.net");
  TextEditingController passwordController =
      TextEditingController(text: "b3z0nV0cLO");

  login() async {
    String token = await AirLinesDioHelper.airLinesDioHelper
        .login(userNameController.text, passwordController.text);
    log(token);
    SpHelper.spHelper.saveToken(token);
    if (SpHelper.spHelper.getToken() != null) {
      getPassengers();
      AppRouter.navigateWithReplacementToWidget(PassengerScreen());
    } else {
      CustomDialog.showDialogFunction("invalid token");
    }
  }

  List<Passenger> passengers = [];
  int page = 0;
  bool isLoading = false;
  getMorePassegngers() {
    page++;
    getPassengers();
  }

  getPassengers() async {
    isLoading = true;
    notifyListeners();
    PassengerResponse passengerResponse =
        await AirLinesDioHelper.airLinesDioHelper.getPassengers(page);
    passengers.addAll(passengerResponse.passengersList ?? []);
    isLoading = false;
    notifyListeners();
  }

  getToken() {
    SpHelper.spHelper.getToken();
  }

  logOut() {
    SpHelper.spHelper.deleteToken();
    AppRouter.navigateWithReplacementToWidget(LoginScreen());
  }
}
