import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LatLng? _tapLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(23.768655499935438, 90.42548872503706),
        ),
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onTap: (LatLng latLang) {
          print('On Taped $latLang');
          setState(() {
            _tapLocation = latLang;
          });
        },
        onLongPress: (LatLng latLang) {
          print('On Long Press at $latLang ');
        },
        mapType: MapType.normal,
        trafficEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: <Marker>{
          Marker(
            markerId: MarkerId('Tanvir'),
            position: LatLng(23.77479847865876, 90.42706232517958),
            icon: BitmapDescriptor.defaultMarker,
            onTap: () {
              print('Tap on the marker');
            },
            infoWindow: InfoWindow(
              title: 'Tanvir',
              onTap: () {
                print('On tap on the info window');
              },
            ),
          ),
          Marker(
            markerId: MarkerId('Amit'),
            position: LatLng(23.77361014536833, 90.42838532477617),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta,
            ),
            onTap: () {
              print('Tap on the marker');
            },
            infoWindow: InfoWindow(
              title: 'Amit',
              onTap: () {
                print('On tap on the info window');
              },
            ),
          ),
          Marker(
            markerId: MarkerId('Tanvir Office'),
            position: LatLng(23.772762381211223, 90.42687591165304),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure,
            ),
            onTap: () {
              print('Tap on the marker');
            },
            infoWindow: InfoWindow(
              title: 'Tanvir Office',
              onTap: () {
                print('On tap on the info window');
              },
            ),
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId('Tanvir-Amit'),
            points: [
              LatLng(23.77479847865876, 90.42706232517958),
              LatLng(23.77361014536833, 90.42838532477617),
              LatLng(23.772762381211223, 90.42687591165304),
              LatLng(23.77479847865876, 90.42706232517958),
            ],
            onTap: () {},
            color: Colors.green,
            width: 10,
            endCap: Cap.roundCap,
            startCap: Cap.roundCap,
            jointType: .round,
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('danger-zone'),
            center: LatLng(23.768841668596913, 90.42548149824142),
            radius: 400,
            strokeColor: Colors.green,
            fillColor: Colors.red.withAlpha(50),
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId('random-polygon'),
            points: [
              LatLng(23.764298857644096, 90.42831391096115),
              LatLng(23.76444952011113, 90.42205564677715),
              LatLng(23.76917121183287, 90.41954476386309),
              LatLng(23.773842719585648, 90.42084664106369),
              LatLng(23.77712203314095, 90.42518813163042),
              LatLng(23.772926227483413, 90.42968720197678),
              LatLng(23.767790745346133, 90.43042950332165),
            ],
            strokeColor: Colors.green,
            fillColor: Colors.red.withAlpha(30),
          ),
        },
      ),
      floatingActionButtonLocation: .centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
          onPressed: () {
          _movedToHome();

          }),
    );
  }
  void _movedToHome(){
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          target:LatLng(23.768655499935438, 90.42548872503706),
        zoom: 16
      ))
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _mapController?.dispose();
    super.dispose();
  }

}
