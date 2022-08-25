import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';
import 'package:flutter/material.dart';

class PassengerWidget extends StatelessWidget {
  Passenger passenger;
  PassengerWidget(this.passenger);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.06),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(width: 50, height: 50,
          child: Image.network(passenger.airline?.first.logo ?? "none",fit: BoxFit.cover,)),
          const SizedBox(width: 10,),
          Column(
            children: [
              Text(passenger.name ?? "none"),
              Text(passenger.trips?.toString() ?? "nosne"),
            ],
          )
        ],
      ),
    );
  }
}
