import 'package:ecommerce_api/airlines_app/data/sp_helper.dart';
import 'package:ecommerce_api/airlines_app/router/router.dart';
import 'package:ecommerce_api/airlines_app/views/screens/login_screen.dart';
import 'package:ecommerce_api/airlines_app/views/screens/passenger_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NavigationFunction();
  }

  NavigationFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    String? token = SpHelper.spHelper.getToken();
    if (token == null) {
      AppRouter.navigateWithReplacementToWidget(LoginScreen());
    } else {
      AppRouter.navigateWithReplacementToWidget(PassengerScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigationFunction();
    return const Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 150,
      )),
    );
  }
}
