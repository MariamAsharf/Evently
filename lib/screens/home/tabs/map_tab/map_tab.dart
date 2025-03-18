import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  CameraPosition initCamera = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  late Set<Marker> marker = {
    Marker(markerId: MarkerId("1"), position: initCamera.target)
  };

  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Position currentPosition = await LocationService.determinePosition();
          // LatLng location =
          //     LatLng(currentPosition.latitude, currentPosition.longitude);
          // controller.animateCamera(CameraUpdate.newLatLngZoom(location, 12));
          // marker.add(
          //   Marker(markerId: MarkerId("1"), position: location),
          // );
          // setState(() {});
          // print(currentPosition.toString());

          updateLocation();
        },
        child: Icon(
          Icons.location_searching,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      body: GoogleMap(
        onTap: (LatLng position) async {
          List<Placemark> place = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          if (place.isNotEmpty) {
            print(place[0].country);
          }
          setState(() {});
        },
        key: UniqueKey(),
        initialCameraPosition: initCamera,
        markers: marker,
        onMapCreated: (GoogleMapController googleController) {
          controller = googleController;
        },
      ),
    );
  }

  void updateLocation() {
    Stream<Position> location = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 100,
      ),
    );
    location.listen(
      (Position current) {
        LatLng place = LatLng(current.latitude, current.longitude);
        marker.add(
          Marker(markerId: MarkerId("1"), position: place),
        );
        controller.animateCamera(
          CameraUpdate.newLatLngZoom(place, 17),
        );
      },
    );
    setState(() {});
  }
}
