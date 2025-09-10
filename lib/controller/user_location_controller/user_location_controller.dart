import 'dart:developer';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class UserLocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isLoading = false.obs;
  var permissionGranted = false.obs;

  /// Check & Request Permission
  Future<bool> _handlePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permissionGranted.value = false;
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permissionGranted.value = false;
      return false;
    }

    permissionGranted.value = true;
    return true;
  }

  /// Get Current Location
  Future<void> getCurrentLocation() async {
    isLoading.value = true;
    bool hasPermission = await _handlePermission();

    if (!hasPermission) {
      isLoading.value = false;
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      log("User Current Location == ${latitude.value}");
      log("User Current Location == ${longitude.value}");
    } catch (e) {
      log("Location Error: $e");
    }

    isLoading.value = false;
  }

  /// Open Google Maps with driver → delivery
  Future<void> openGoogleMap(double deliveryLat, double deliveryLng) async {
    if (!permissionGranted.value) {
      Get.snackbar("Permission", "Location permission not granted");
      return;
    }
    final driverLat = latitude.value;
    final driverLng = longitude.value;
    final googleUrl =
        "https://www.google.com/maps/dir/?api=1&origin=$driverLat,$driverLng&destination=$deliveryLat,$deliveryLng&travelmode=driving";
    final uri = Uri.parse(googleUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not open Google Maps");
    }
  }
}
