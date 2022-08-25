import 'package:ecommerce_api/airlines_app/models/passenger_response.dart';
import 'package:ecommerce_api/airlines_app/providers/airlines_dio_provider.dart';
import 'package:ecommerce_api/airlines_app/views/widgets/passenger_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class PassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AirLinesProvider>(
      builder: (context, airLineProvider, x) {
        return Scaffold(
          appBar: AppBar(title: const Text("Passengers")),
          body : airLineProvider.passengers.isEmpty ? 
          const Center(child: CircularProgressIndicator(),) 
          : Column(
            children: [
              Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: (){
                    
                  },
                  child: ListView.builder(
                    itemCount: airLineProvider.passengers.length,
                    itemBuilder: ( context,  index) {
                      return PassengerWidget(airLineProvider.passengers[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
