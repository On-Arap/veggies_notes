import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:veggies_notes/domain/googlemaps/geoloc.dart';
import 'package:veggies_notes/utils/bitmapFromSvgAsset.dart';
import 'package:veggies_notes/utils/secrets.dart';
import '../../config/routing/destinations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_maps_webservices/places.dart';

class MapPage extends StatefulWidget {
  final Destination destination;

  const MapPage({super.key, required this.destination});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final _places = GoogleMapsPlaces(apiKey: MAPS_API_KEY);

  LatLng _center = const LatLng(40.730610, -73.935242);
  double _zoom = 12.0;
  List<Marker> markers = [];
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  void _getCurrentLocation() async {
    Position currentLocation = await GeolocHandler.determinePosition();
    _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    _zoom = 15.0;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _center, zoom: _zoom)));
    markers.add(Marker(markerId: const MarkerId('currentPosition'), position: _center, icon: await bitmapDescriptorFromSvgAsset('assets/map/location_pin.svg')));
    setState(() {});
  }

  void _searchNearbyRestaurants() async {
    Position currentLocation = await GeolocHandler.determinePosition();

    final result = await _places.searchNearbyWithRadius(
      Location(lat: currentLocation.latitude, lng: currentLocation.longitude),
      1000,
      type: "restaurant",
      keyword: "vegetarian",
    );
    if (result.status == "OK") {
      for (var rest in result.results) {
        markers.add(
          Marker(
            markerId: MarkerId(rest.name),
            position: LatLng(rest.geometry!.location.lat, rest.geometry!.location.lng),
            icon: await bitmapDescriptorFromSvgAsset('assets/map/restaurant_pin.svg'),
          ),
        );
        setState(() {});
      }
    } else {
      print(result.errorMessage);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _searchNearbyRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veggies Places'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: markers.toSet(),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: _zoom,
        ),
      ),
    );
  }
}
