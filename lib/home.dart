import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoodeye/constants/colors.dart';
import 'package:hoodeye/controller/finalController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hoodeye/screens/notifyScreen.dart';

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
    crimeController.getParsedData('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroupDataMurder() {
      List<BarChartGroupData> BarData = [];
      for (int i = 0; i < crimeController.XMurder.length; i++) {
        BarData.add(BarChartGroupData(x: crimeController.YMurder[i], barRods: [
          BarChartRodData(
            toY: crimeController.XMurder[i].toDouble(),
            fromY: 0,
            width: 6,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          )
        ]));
      }
      return BarData;
    }

    List<BarChartGroupData> barGroupDataATOM() {
      List<BarChartGroupData> BarData = [];
      for (int i = 0; i < crimeController.XATOM.length; i++) {
        BarData.add(BarChartGroupData(x: crimeController.YATOM[i], barRods: [
          BarChartRodData(
            toY: crimeController.XATOM[i].toDouble(),
            fromY: 0,
            width: 6,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          )
        ]));
      }
      return BarData;
    }

    List<BarChartGroupData> barGroupDataHOM() {
      List<BarChartGroupData> BarData = [];
      for (int i = 0; i < crimeController.XHOM.length; i++) {
        BarData.add(BarChartGroupData(x: crimeController.YHOM[i], barRods: [
          BarChartRodData(
            toY: crimeController.XHOM[i].toDouble(),
            fromY: 0,
            width: 6,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          )
        ]));
      }
      return BarData;
    }

    List<BarChartGroupData> barGroupDataRAPE() {
      List<BarChartGroupData> BarData = [];
      for (int i = 0; i < crimeController.XRAPE.length; i++) {
        BarData.add(BarChartGroupData(x: crimeController.YRAPE[i], barRods: [
          BarChartRodData(
            toY: crimeController.XRAPE[i].toDouble(),
            fromY: 0,
            width: 6,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          )
        ]));
      }
      return BarData;
    }

    List<BarChartGroupData> barGroupDataKIDAB() {
      List<BarChartGroupData> BarData = [];
      for (int i = 0; i < crimeController.XKIDAB.length; i++) {
        BarData.add(BarChartGroupData(x: crimeController.YKIDAB[i], barRods: [
          BarChartRodData(
            toY: crimeController.XKIDAB[i].toDouble(),
            fromY: 0,
            width: 6,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          )
        ]));
      }
      return BarData;
    }

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
            CarouselSlider(
                items: [
                  MurdersCarousel(barGroupDataMurder),
                  ATOMCarousel(barGroupDataATOM),
                  HOMCarousel(barGroupDataHOM),
                  RAPECarousel(barGroupDataRAPE),
                  KIDABCarousel(barGroupDataKIDAB),
                ],
                options: CarouselOptions(
                    aspectRatio: 1,
                    height: 400,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1)),
            SaferPlacesContainer(),
            ResourcesContainer()
          ],
        ),
      ),
    );
  }

  Padding ResourcesContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
      child: Container(
        height: 250,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Pallete.drawerback, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resources Near You',
                style: TextStyle(
                    color: Pallete.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding SaferPlacesContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
      child: Container(
        height: 250,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Pallete.drawerback, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Safer Places near you',
                style: TextStyle(
                    color: Pallete.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container ATOMCarousel(List<BarChartGroupData> barGroupDataATOM()) {
    return Container(
      child: Column(
        children: [
          GetBuilder<LocationController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'Attempt to Murder Around ${locationController.currentAddress}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Pallete.grey, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          GetBuilder<CrimeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.drawerback,
                      borderRadius: BorderRadius.circular(20)),
                  width: 350,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BarChart(
                      BarChartData(
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(axisNameSize: 50),
                              leftTitles: AxisTitles(axisNameSize: 0),
                              rightTitles: AxisTitles(axisNameSize: 0),
                              topTitles: AxisTitles(axisNameSize: 0)),
                          minY: 0,
                          barGroups: barGroupDataATOM()),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Container HOMCarousel(List<BarChartGroupData> barGroupDataHOM()) {
    return Container(
      child: Column(
        children: [
          GetBuilder<LocationController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'Homicide Around ${locationController.currentAddress}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Pallete.grey, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          GetBuilder<CrimeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.drawerback,
                      borderRadius: BorderRadius.circular(20)),
                  width: 350,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BarChart(
                      BarChartData(
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(axisNameSize: 50),
                              leftTitles: AxisTitles(axisNameSize: 0),
                              rightTitles: AxisTitles(axisNameSize: 0),
                              topTitles: AxisTitles(axisNameSize: 0)),
                          minY: 0,
                          barGroups: barGroupDataHOM()),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Container RAPECarousel(List<BarChartGroupData> barGroupDataRAPE()) {
    return Container(
      child: Column(
        children: [
          GetBuilder<LocationController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'Rapes Around \n ${locationController.currentAddress}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Pallete.grey, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          GetBuilder<CrimeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.drawerback,
                      borderRadius: BorderRadius.circular(20)),
                  width: 350,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BarChart(
                      BarChartData(
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(axisNameSize: 50),
                              leftTitles: AxisTitles(axisNameSize: 0),
                              rightTitles: AxisTitles(axisNameSize: 0),
                              topTitles: AxisTitles(axisNameSize: 0)),
                          minY: 0,
                          barGroups: barGroupDataRAPE()),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Container MurdersCarousel(List<BarChartGroupData> barGroupDataMurder()) {
    return Container(
      child: Column(
        children: [
          GetBuilder<LocationController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'Murders Around ${locationController.currentAddress}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Pallete.grey, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          GetBuilder<CrimeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.drawerback,
                      borderRadius: BorderRadius.circular(20)),
                  width: 350,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BarChart(
                      BarChartData(
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(axisNameSize: 50),
                              leftTitles: AxisTitles(axisNameSize: 0),
                              rightTitles: AxisTitles(axisNameSize: 0),
                              topTitles: AxisTitles(axisNameSize: 0)),
                          minY: 0,
                          barGroups: barGroupDataMurder()),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Container KIDABCarousel(List<BarChartGroupData> barGroupDataKIDAB()) {
    return Container(
      child: Column(
        children: [
          GetBuilder<LocationController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'Kidnapping Abduction Around ${locationController.currentAddress}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Pallete.grey, fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          GetBuilder<CrimeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.drawerback,
                      borderRadius: BorderRadius.circular(20)),
                  width: 350,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BarChart(
                      BarChartData(
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(
                            show: true,
                          ),
                          titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(axisNameSize: 50),
                              leftTitles: AxisTitles(axisNameSize: 0),
                              rightTitles: AxisTitles(axisNameSize: 0),
                              topTitles: AxisTitles(axisNameSize: 0)),
                          minY: 0,
                          barGroups: barGroupDataKIDAB()),
                    ),
                  ),
                ),
              );
            },
          )
        ],
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
          child: GestureDetector(
            onTap: () {
              Get.to(() => NotifyScreen(),
                  transition: Transition.circularReveal);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Pallete.redaccent,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 5, top: 5),
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
          ),
        )
      ],
    );
  }
}
