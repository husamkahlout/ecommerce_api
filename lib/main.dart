import 'package:ecommerce_api/airlines_app/providers/airlines_dio_provider.dart';
import 'package:ecommerce_api/airlines_app/views/screens/passenger_screen.dart';
import 'package:ecommerce_api/e_commerce_app/providers/dio_provider.dart';
import 'package:ecommerce_api/e_commerce_app/router/router.dart';
import 'package:ecommerce_api/e_commerce_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DioProvider>(create: (context)=> DioProvider()),
        ChangeNotifierProvider<AirLinesProvider>(create: (context)=> AirLinesProvider()),
      ],
      child:MaterialApp(
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce Api',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PassengerScreen(),
      ),
    );
  }
}
