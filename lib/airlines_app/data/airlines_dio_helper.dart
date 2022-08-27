import 'package:dio/dio.dart';
import 'package:ecommerce_api/airlines_app/data/sp_helper.dart';
import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';

class AirLinesDioHelper {
  AirLinesDioHelper._();
  static AirLinesDioHelper airLinesDioHelper = AirLinesDioHelper._();
  Dio dioInstance = Dio();

  // get passengers without authorization
  // Future<PassengerResponse> getPassengers([int page = 0]) async {
  // queryParameters to control the response data i will get from the server
  //   Response response = await dioInstance
  //       .get("https://api.instantwebtools.net/v1/passenger", queryParameters: {
  //     'size': 10,
  //     'page': page,
  //   });
  //   PassengerResponse passengerResponse =
  //       PassengerResponse.fromJson(response.data);
  //   return passengerResponse;
  // }
  Future<String> login(String userName, String password) async {
    String url =
        "https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token";
    Map<String, dynamic> queryParamsMaps = {
      'scope': 'offline_access',
      'grant_type': 'password',
      'username': userName,
      'password': password,
      'client_id': '0oahdhjkutaGcIK2M4x6'
    };
    Map<String, dynamic> headersMap = {"host": "dev-457931.okta.com", "content-type": "application/x-www-form-urlencoded"};
    Response loginResponse =
        await dioInstance.post(url, queryParameters: queryParamsMaps, options: Options(headers: headersMap));
    return loginResponse.data["access_token"];
  }

  // ====================== get passengers with authorization ==================================

  Future<PassengerResponse> getPassengers(int page) async {
    // queryParameters to control the response data i will get from the server
    Response response = await dioInstance.get(
      "https://api.instantwebtools.net/v2/passenger",
      queryParameters: {
        'size': 10,
        'page': page,
      },
      options: Options(headers: {
        "Authorization":
            "Bearer ${SpHelper.spHelper.getToken()}",
      }),
    );
    PassengerResponse passengerResponse =
        PassengerResponse.fromJson(response.data);
    return passengerResponse;
  }
}
