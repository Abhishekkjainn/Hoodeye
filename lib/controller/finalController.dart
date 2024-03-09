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

  CrimeController crimeController = Get.put(CrimeController());
  ResourceController resourceController = Get.put(ResourceController());
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
    // await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    //     .then((Position position) {
    //   currentPosition = position;
    //   getAddressFromLatLng(currentPosition!);
    // }).catchError((e) {
    //   debugPrint(e);
    // });
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
      crimeController.filterCrimesByDistrict(place.locality!);
      resourceController.filterResourcesByDistrict(place.locality!);
    }
    ;
    update();
  }
}

class CrimeController extends GetxController {
  late List<CrimeData> TotalCrimes = [];
  late List<CrimeData> filteredCrimes = [];
  List<int> XMurder = [];
  List<int> YMurder = [];
  List<int> XATOM = [];
  List<int> YATOM = [];
  List<int> XHOM = [];
  List<int> YHOM = [];
  List<int> XRAPE = [];
  List<int> YRAPE = [];
  List<int> XCUSRAPE = [];
  List<int> YCUSRAPE = [];
  List<int> XKIDAB = [];
  List<int> YKIDAB = [];
  List<int> XKIDWOM = [];
  List<int> YKIDWOM = [];
  List<int> XKIDOTH = [];
  List<int> YKIDOTH = [];
  List<int> XDAC = [];
  List<int> YDAC = [];
  List<int> XPREDAC = [];
  List<int> YPREDAC = [];
  List<int> XROB = [];
  List<int> YROB = [];
  List<int> XBURG = [];
  List<int> YBURG = [];
  List<int> XTHFT = [];
  List<int> YTHFT = [];
  List<int> XAUTOTHFT = [];
  List<int> YAUTOTHFT = [];
  List<int> XOTHTHFT = [];
  List<int> YOTHTHFT = [];
  List<int> XRIOT = [];
  List<int> YRIOT = [];
  List<int> XPROP = [];
  List<int> YPROP = [];
  List<int> XCHEAT = [];
  List<int> YCHEAT = [];
  List<int> XCOUNTER = [];
  List<int> YCOUNTER = [];
  List<int> XFIRE = [];
  List<int> YFIRE = [];
  List<int> XHURT = [];
  List<int> YHURT = [];
  List<int> XDOW = [];
  List<int> YDOW = [];
  List<int> XASSM = [];
  List<int> YASSM = [];
  List<int> XINSULT = [];
  List<int> YINSULT = [];
  List<int> XCRUEL = [];
  List<int> YCRUEL = [];
  List<int> XIMP = [];
  List<int> YIMP = [];
  List<int> XNEG = [];
  List<int> YNEG = [];
  List<int> XOTHER = [];
  List<int> YOTHER = [];
  List<int> XTOTAL = [];
  List<int> YTOTAL = [];

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
    addtoXandYmurder();
    addtoXandYattemptToMurder();
    addtoXandYhomicide();
    addtoXandYrape();
    addtoXandYcustodialRape();
    addtoXandYkidnappingabduction();
    update();
  }

  void addtoXandYmurder() {
    XMurder.clear();
    YMurder.clear();
    for (int i = 0; i < filteredCrimes.length; i++) {
      YMurder.add(filteredCrimes[i].year);
      XMurder.add(filteredCrimes[i].murder);
    }
  }

  void addtoXandYattemptToMurder() {
    XATOM.clear();
    YATOM.clear();
    for (int i = 0; i < filteredCrimes.length; i++) {
      YATOM.add(filteredCrimes[i].year);
      XATOM.add(filteredCrimes[i].attemptToMurder);
    }
  }

  void addtoXandYhomicide() {
    XHOM.clear();
    YHOM.clear();
    for (int i = 0; i < filteredCrimes.length; i++) {
      YHOM.add(filteredCrimes[i].year);
      XHOM.add(filteredCrimes[i].homicide);
    }
  }

  void addtoXandYrape() {
    XRAPE.clear();
    YRAPE.clear();
    for (int i = 0; i < filteredCrimes.length; i++) {
      YRAPE.add(filteredCrimes[i].year);
      XRAPE.add(filteredCrimes[i].rape);
    }
  }

  void addtoXandYcustodialRape() {
    XCUSRAPE.clear();
    YCUSRAPE.clear();
    for (int i = 0; i < filteredCrimes.length; i++) {
      YCUSRAPE.add(filteredCrimes[i].year);
      XCUSRAPE.add(filteredCrimes[i].custodialRape);
    }
  }

  void addtoXandYkidnappingabduction() {
    XKIDAB.clear();
    YKIDAB.clear();
    for (int i = 0; i < filteredCrimes.length; i++) {
      YKIDAB.add(filteredCrimes[i].year);
      XKIDAB.add(filteredCrimes[i].kidnappingabduction);
    }
  }
}

class ResourceController extends GetxController {
  late List<ResourceModal> TotalResources = [];
  late List<ResourceModal> filteredResources = [];
  Future<List<ResourceModal>> getParsedDataResources(districtname) async {
    String jsonResource =
        await rootBundle.loadString('assets/images/resourcesnear.json');

    List<dynamic> jsonResourceList = json.decode(jsonResource);
    List<ResourceModal> FullResources =
        jsonResourceList.map((json) => ResourceModal.fromMap(json)).toList();
    TotalResources.addAll(FullResources);
    print(TotalResources.length);
    if (TotalResources != 0) {
      filterResourcesByDistrict(districtname);
    }
    return FullResources;
  }

  void filterResourcesByDistrict(String districtName) {
    filteredResources = TotalResources.where((res) =>
        res.distrctname.toUpperCase() == districtName.toUpperCase()).toList();
    print('Filtered Resources for $districtName: ${filteredResources.length}');
  }
}
