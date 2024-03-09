import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoodeye/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _currentAddress;
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    _handleLocationPermission();
    _getCurrentPosition();
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
          children: [
            LocationContainer(),
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
              borderRadius: BorderRadius.circular(10),
              color: Pallete.drawerback),
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
                        '${_currentPosition ?? ""}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Pallete.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.refresh_circled_solid,
                          color: Pallete.blue,
                        ))
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     children: [
              //       Icon(
              //         CupertinoIcons
              //             .line_horizontal_3_decrease_circle_fill,
              //         color: Pallete.white,
              //       ),
              //     ],
              //   ),
              // )
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
