import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreen();
}

class _GoogleMapsScreen extends State<GoogleMapsScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(31.501943295398213, 34.46731388568878);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          centerTitle: true,
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onTap: (LatLng point) {
            mapController.animateCamera(CameraUpdate.newLatLng(point));
            log(point.latitude.toString());
            log(point.longitude.toString());
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 3.0,
          ),
        ),
      ),
    );
  }
}
