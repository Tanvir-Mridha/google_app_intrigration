import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key});

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

Position? _currentPosition;
StreamSubscription? _locationSubscriber;

class _MyLocationScreenState extends State<MyLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Location')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Current Location: ${_currentPosition?.latitude}, ${_currentPosition?.longitude}',
            ),
            FilledButton(
              onPressed: _getCurrentLocation,
              child: const Text('Get Location'),
            ),
            FilledButton(
              onPressed: _listenCurrentLocation,
              child: const Text('Listen Current Location'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool isPermissionEnabled = await _isPermissionEnabled();

    if (isPermissionEnabled) {
      bool isLocationServiceEnabled =
      await Geolocator.isLocationServiceEnabled();

      if (isLocationServiceEnabled) {
        Position position = await Geolocator.getCurrentPosition();
        print(position);

        _currentPosition = position;
        setState(() {});
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      bool isPermissionEnabled = await _requestPermission();

      if (isPermissionEnabled) {
        _getCurrentLocation();
      } else {
        // Geolocator.openAppSettings();
      }
    }
  }
  Future<void> _listenCurrentLocation() async {
    bool isPermissionEnabled = await _isPermissionEnabled();

    if (isPermissionEnabled) {
      bool isLocationServiceEnabled =
      await Geolocator.isLocationServiceEnabled();

      if (isLocationServiceEnabled) {
        Position position = await Geolocator.getCurrentPosition();
        print(position);
        _locationSubscriber = Geolocator.getPositionStream().listen((Position? newPosition){
          _currentPosition = position;
          setState(() {});
        });

      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      bool isPermissionEnabled = await _requestPermission();

      if (isPermissionEnabled) {
        _getCurrentLocation();
      } else {
        // Geolocator.openAppSettings();
      }
    }
  }

  Future<bool> _isPermissionEnabled() async {
    LocationPermission permission = await Geolocator.checkPermission();

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
  void dispose(){
    _locationSubscriber?.cancel();
    super.dispose();
  }
}