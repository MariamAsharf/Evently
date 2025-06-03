import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  final bool isFromCreateEvent;

  MapTab({this.isFromCreateEvent = false});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  CameraPosition? initCamera;
  GoogleMapController? controller;
  Set<Marker> markers = {};
  LatLng? selectedLocation;
  LatLng? originalLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'location_btn',
            onPressed: () {
              if (originalLocation != null && controller != null) {
                controller!.animateCamera(
                  CameraUpdate.newLatLngZoom(originalLocation!, 14),
                );
              }
            },
            child: Icon(Icons.my_location),
          ),
          SizedBox(height: 16),
          if (widget.isFromCreateEvent && selectedLocation != null)
            FloatingActionButton(
              heroTag: 'check_btn',
              onPressed: () {
                Navigator.pop(context, selectedLocation);
              },
              child: Icon(
                Icons.check,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
        ],
      ),
      body: initCamera == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              zoomControlsEnabled: false,
              onTap: (LatLng position) {
                updateMarker(position);
              },
              initialCameraPosition: initCamera!,
              markers: markers,
              onMapCreated: (GoogleMapController googleController) {
                controller = googleController;
              },
            ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    LatLng userLocation =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    setState(() {
      initCamera = CameraPosition(target: userLocation, zoom: 14);
      originalLocation = userLocation; // حفظ الموقع الأصلي
    });

    updateMarker(userLocation);
  }

  void updateMarker(LatLng newPosition) {
    setState(() {
      selectedLocation = newPosition;
      markers = {
        Marker(
          markerId: MarkerId("selected_location"),
          position: newPosition,
          infoWindow: InfoWindow(title: "Selected Location"),
        ),
      };
    });

    if (controller != null) {
      controller!.animateCamera(
        CameraUpdate.newLatLngZoom(newPosition, 17),
      );
    }
  }
}
