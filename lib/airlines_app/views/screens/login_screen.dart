import 'package:ecommerce_api/airlines_app/providers/airlines_dio_provider.dart';
import 'package:ecommerce_api/airlines_app/router/router.dart';
import 'package:ecommerce_api/airlines_app/views/screens/passenger_screen.dart';
import 'package:ecommerce_api/airlines_app/views/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        centerTitle: true,
      ),
      body: Consumer<AirLinesProvider>(builder: (context, airLinesProvider, x) {
        return Container(
          color: Colors.grey.withOpacity(0.06),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: airLinesProvider.userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text('user name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: airLinesProvider.passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: const Text('password'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    airLinesProvider.login();

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => PassengerScreen()));
                  },
                  child: const Text("login")),
            ],
          ),
        );
      }),
    );
  }
}
