import 'package:dio/dio.dart';
import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';

class AirLinesDioHelper {
  AirLinesDioHelper._();
  static AirLinesDioHelper airLinesDioHelper = AirLinesDioHelper._();
  Dio dioInstance = Dio();

  Future<PassengerResponse> getPassengers([int page = 0]) async {
    // queryParameters to control the response data i will get from the server 
    Response response = await dioInstance
        .get("https://api.instantwebtools.net/v1/passenger", queryParameters: {
      'size': 10,
      'page': page,
    });
    PassengerResponse passengerResponse =
        PassengerResponse.fromJson(response.data);
    return passengerResponse;
  }
}
