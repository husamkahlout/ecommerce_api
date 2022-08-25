import 'package:ecommerce_api/airlines_app/data/airlines_dio_helper.dart';
import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';
import 'package:flutter/material.dart';

class AirLinesProvider extends ChangeNotifier {
  AirLinesProvider() {
    getPassengers();
    notifyListeners();
  }
  List<Passenger> passengers = [];
  int page = 0;
  getMorePassegngers() {
    page++;
    getPassengers();
  }

  getPassengers() async {
    PassengerResponse passengerResponse =
        await AirLinesDioHelper.airLinesDioHelper.getPassengers(page);
    passengers.addAll(passengerResponse.passengersList ?? []);
    notifyListeners();
  }
}
