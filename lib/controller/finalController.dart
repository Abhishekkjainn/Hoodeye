import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hoodeye/controller/crimeModal.dart';
import 'package:http/retry.dart';

class LocationController extends GetxController {
  String? currentAddress;
  Position? currentPosition;
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
          'Location Services Are Disabled Please Enable Location Services.',
          '');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location Permission is Denied :(', '');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          'Location Permission is Denied Permanently, We cant Request Permissino :(',
          '');
      return false;
    }
    update();
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
    update();
  }

  Future<void> getAddressFromLatLng(Position position) async {
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final place = placemarks.isNotEmpty ? placemarks[0] : null;

    if (place != null) {
      currentAddress =
          '${place.locality}, ${place.administrativeArea}, ${place.postalCode}';
    }
    ;
    update();
  }
}

class CrimeController extends GetxController {
  late List<CrimeData> TotalCrimes = [];
  late List<CrimeData> filteredCrimes = [];

  Future<List<CrimeData>> getParsedData(districtname) async {
    String jsonCrime =
        await rootBundle.loadString('assets/images/finalData.json');

    List<dynamic> jsonCrimeList = json.decode(jsonCrime);
    List<CrimeData> FullCrime =
        jsonCrimeList.map((json) => CrimeData.fromMap(json)).toList();
    TotalCrimes.addAll(FullCrime);
    print(TotalCrimes.length);
    if (TotalCrimes != 0) {
      filterCrimesByDistrict(districtname);
    }
    return FullCrime;
  }

  void filterCrimesByDistrict(String districtName) {
    filteredCrimes = TotalCrimes.where((crime) =>
        crime.district.toUpperCase() == districtName.toUpperCase()).toList();

    print('Filtered crimes for $districtName: ${filteredCrimes.length}');
  }
}
