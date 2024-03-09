import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hoodeye/constants/colors.dart';
import 'package:hoodeye/controller/finalController.dart';
import 'controller/crimeModal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationController locationController = Get.find();
  CrimeController crimeController = Get.find();

  @override
  void initState() {
    locationController.handleLocationPermission();
    locationController.getCurrentPosition();
    crimeController.getParsedData('Durg');
    // crimeController.filterCrimesByDistrict('VELLORE');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.black,
      appBar: AppBarMain(),
      drawer: Drawer(
        backgroundColor: Pallete.drawerback,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<LocationController>(
              builder: (controller) {
                return LocationContainer();
              },
            ),
            GetBuilder<CrimeController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.filteredCrimes.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      crimeController.filteredCrimes[index].state,
                      style: TextStyle(color: Colors.white),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Padding LocationContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Pallete.blue, width: 2),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Pallete.blue.withOpacity(0.2),
                    Pallete.blue.withOpacity(0.35)
                  ])),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: Pallete.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 200,
                      // color: Colors.amberAccent,
                      child: Text(
                        '${locationController.currentAddress ?? "Finding Your Location.."}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Pallete.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          locationController.currentAddress = '';
                          locationController.getCurrentPosition();
                        },
                        icon: Icon(
                          CupertinoIcons.refresh_circled_solid,
                          color: Pallete.blue,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar AppBarMain() {
    return AppBar(
      iconTheme: IconThemeData(color: Pallete.grey),
      centerTitle: true,
      backgroundColor: Pallete.black,
      title: Image.asset(
        'assets/images/hoodeyelogo.png',
        height: 30,
        color: Pallete.white,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Pallete.redaccent,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.bell_solid,
                    color: Pallete.white,
                    size: 14,
                  ),
                  Text(
                    'Notify',
                    style: TextStyle(
                        color: Pallete.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
