// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoodeye/constants/colors.dart';
import 'package:hoodeye/controller/finalController.dart';
import 'package:hoodeye/home.dart';
import 'package:hoodeye/screens/takingInfo.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LocationController locationController = Get.put(LocationController());
  CrimeController crimeController = Get.put(CrimeController());
  ResourceController resourceController = Get.put(ResourceController());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ResourceController resourceController = Get.put(ResourceController());
  @override
  void initState() {
    // resourceController.clearSplash();
    toSplashorMain();
    super.initState();
  }

  void toSplashorMain() async {
    await Future.delayed(Duration(milliseconds: 3000));
    if (resourceController.readSplash() == true) {
      Get.off(() => Home());
    }
    if (resourceController.readSplash() == false ||
        resourceController.readSplash() == null) {
      Get.off(() => SplashScreen(), transition: Transition.downToUp);
    }
    // Get.off(() => SplashScreen(), transition: Transition.downToUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.black,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(color: Pallete.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hoodeyelogo.png',
              color: Colors.redAccent,
              height: 100,
              width: 100,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Hoodeye',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ResourceController resourceController = Get.put(ResourceController());
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.black,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Upper Container
            Expanded(
                child: Container(
              child: CarouselSlider(
                  items: [
                    splash1(),
                    splash2(),
                    splash3(),
                    splash4(),
                    splash5()
                  ],
                  options: CarouselOptions(
                      aspectRatio: 0.5,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          ind = index;
                        });
                      },
                      viewportFraction: 1)),
            )),
            //bottom Container
            Container(
              width: double.maxFinite,
              height: 120,
              // decoration: BoxDecoration(color: Colors.amberAccent),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 10,
                      width: 200,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  height: 10,
                                  width: (ind == index) ? 40 : 10,
                                  decoration: BoxDecoration(
                                      color: (ind == index)
                                          ? Pallete.blue
                                          : Pallete.grey,
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.off(() => InfoPageName(),
                            transition: Transition.downToUp);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                            width: 250,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40)),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container splash1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Text(
              'Get to Know People Around You.',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Pallete.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset('assets/images/people.json', height: 250),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Text(
              'Navigate Your World: Assess Neighborhood Safety and Community Atmosphere at Your Fingertips.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Container splash2() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Text(
              'Know About Your Neighbourhood.',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Pallete.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset('assets/images/neighbourhood.json', height: 250),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Text(
              'Unlock Your Neighborhood\'s Past: Explore Historical Crime Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Container splash3() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Text(
              'Provides Intel and Action Plans',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Pallete.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset('assets/images/women.json', height: 250),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Text(
              'SOS Buttons , Exit Plans , Panic Mode and much more.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Container splash4() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Text(
              'Check your Locality before Buying.',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Pallete.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset('assets/images/realestate.json',
              height: 250, repeat: false),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Text(
              'Check the Safety Score before buying your Dream House and get Recommendations of better places to buy House.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Container splash5() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Text(
              'Extensive and Govt Verified Criminal Data',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Pallete.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset('assets/images/verified.json',
              height: 250, repeat: false),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
            child: Text(
              'Covers almost all Categories of Criminal Activities Around You. With Government Verification.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
