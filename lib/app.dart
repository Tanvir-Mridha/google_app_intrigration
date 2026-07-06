import 'package:flutter/material.dart';

import 'map_screen.dart';
import 'my_location_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLocationScreen(),
    );
  }
}
