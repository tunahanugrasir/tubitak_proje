import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;
  static const LatLng _center = LatLng(41.43324103, 31.73442601);
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        const Marker(
          markerId: MarkerId('marker_1'),
          position: _center,
          infoWindow: InfoWindow(
            title: 'GooglePlex',
            snippet: 'Google Headquarters',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          scrollGesturesEnabled: true,
          mapType: MapType.satellite,
          initialCameraPosition: const CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers,
        ),
      ),
    );
  }
}
