import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              zoom: 16,
              target: LatLng(23.768655499935438, 90.42548872503706)),
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onTap:(LatLng latLang){
            print('On Taped $latLang');
        },
        onLongPress: (LatLng latLang){
            print('On Long Press at $latLang ');
        },
        mapType: MapType.normal,
        trafficEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller){
            _mapController =controller;
        },
      ),

    );
  }
}

