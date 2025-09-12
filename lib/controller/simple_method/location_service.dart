import 'dart:async';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationService extends GetxService {
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  StreamSubscription<Position>? _positionStream;

  Future<void> startTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    _positionStream =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 10, // meters
          ),
        ).listen((Position position) {
          latitude.value = position.latitude;
          longitude.value = position.longitude;
        });
  }

  void stopTracking() {
    _positionStream?.cancel();
  }

  /// Calculate distance (Haversine formula) in kilometers
  double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    const earthRadius = 6371; // km
    final dLat = _degToRad(endLat - startLat);
    final dLng = _degToRad(endLng - startLng);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(startLat)) *
            cos(_degToRad(endLat)) *
            sin(dLng / 2) *
            sin(dLng / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degToRad(double degree) {
    return degree * pi / 180;
  }

  /// Open Google Maps with navigation
  Future<void> openGoogleMap(double deliveryLat, double deliveryLng) async {
    final originLat = latitude.value;
    final originLng = longitude.value;

    final googleUrl =
        "https://www.google.com/maps/dir/?api=1&origin=$originLat,$originLng"
        "&destination=$deliveryLat,$deliveryLng&travelmode=driving";

    final uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch Google Maps";
    }
  }

  /// Convert distance (in KM) into human readable format
  String formatDistance(double? km) {
    if (km == null || km == double.infinity) return "--";

    if (km >= 1) {
      return "${km.toStringAsFixed(1)} km"; // e.g. 2.3 km
    }

    double meters = km * 1000;
    if (meters >= 1) {
      return "${meters.toStringAsFixed(0)} m"; // e.g. 230 m
    }

    double cm = meters * 100;
    return "${cm.toStringAsFixed(0)} cm"; // e.g. 80 cm
  }
}
