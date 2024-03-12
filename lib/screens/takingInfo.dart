import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoodeye/constants/colors.dart';
import 'package:hoodeye/controller/finalController.dart';
import 'package:hoodeye/home.dart';
import 'package:lottie/lottie.dart';

class InfoPageName extends StatefulWidget {
  const InfoPageName({super.key});

  @override
  State<InfoPageName> createState() => _InfoPageNameState();
}

class _InfoPageNameState extends State<InfoPageName> {
  bool gender = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Select Your Gender',
                        style: TextStyle(
                            color: Pallete.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 60, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: (gender)
                                  ? Colors.transparent
                                  : Colors.blueAccent.withOpacity(0.2),
                              border: Border.all(
                                  color:
                                      (gender) ? Pallete.white : Pallete.blue,
                                  width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Lottie.asset('assets/images/male.json',
                                    height: 150),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                    'Male',
                                    style: TextStyle(
                                        color: (gender)
                                            ? Pallete.white
                                            : Pallete.blue,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: (gender)
                                  ? Colors.blueAccent.withOpacity(0.2)
                                  : Colors.transparent,
                              border: Border.all(
                                  color:
                                      (gender) ? Pallete.blue : Pallete.white,
                                  width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Lottie.asset('assets/images/female.json',
                                    height: 150),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Female',
                                    style: TextStyle(
                                        color: (gender)
                                            ? Pallete.blue
                                            : Pallete.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => infoName(gender),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Pallete.blue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Pallete.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class infoName extends StatelessWidget {
  final bool gender;
  TextEditingController namecontroller = TextEditingController();
  infoName(this.gender, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Enter your Name',
                  style: TextStyle(
                      color: Pallete.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: (gender)
                    ? Lottie.asset('assets/images/female.json',
                        height: 300, width: double.maxFinite)
                    : Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: Lottie.asset('assets/images/male.json',
                            height: 300, width: double.maxFinite),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextFormField(
                  controller: namecontroller,
                  cursorColor: Pallete.white,
                  style: TextStyle(
                      color: Pallete.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 20),
                      hintText: 'Eve',
                      hintStyle: TextStyle(
                          color: Pallete.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Pallete.grey, width: 2)),
                      labelText: 'Enter Full Name',
                      labelStyle: TextStyle(
                          color: Pallete.white, fontWeight: FontWeight.w600),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Pallete.white, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ContactInfo(gender, namecontroller.text),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Pallete.blue,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Pallete.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final bool gender;
  final String username;
  ContactInfo(this.gender, this.username, {super.key});

  @override
  Widget build(BuildContext context) {
    PersonalInfoController infoController = Get.put(PersonalInfoController());
    ResourceController resourceController = Get.find();
    TextEditingController contactcontroller = TextEditingController();
    TextEditingController contactnamecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Pallete.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Add your Emergency Contact',
                  style: TextStyle(
                      color: Pallete.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                    child: Lottie.asset('assets/images/emergencycall.json',
                        height: 300, width: 300, fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextFormField(
                  controller: contactcontroller,
                  cursorColor: Pallete.white,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Pallete.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 20),
                      hintText: '9999999999',
                      hintStyle: TextStyle(
                          color: Pallete.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Pallete.grey, width: 2)),
                      labelText: 'Enter Contact Number',
                      labelStyle: TextStyle(
                          color: Pallete.white, fontWeight: FontWeight.w600),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Pallete.white, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: TextFormField(
                  controller: contactnamecontroller,
                  keyboardType: TextInputType.name,
                  cursorColor: Pallete.white,
                  style: TextStyle(
                      color: Pallete.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 30, top: 20, bottom: 20, right: 20),
                      hintText: 'Father',
                      hintStyle: TextStyle(
                          color: Pallete.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Pallete.grey, width: 2)),
                      labelText: 'Enter Contact Name',
                      labelStyle: TextStyle(
                          color: Pallete.white, fontWeight: FontWeight.w600),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: Pallete.white, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    infoController.setInfo(
                        gender,
                        username,
                        int.parse(contactcontroller.text),
                        contactnamecontroller.text);
                    resourceController.setSplash();
                    Get.off(() => Home(), transition: Transition.rightToLeft);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Pallete.blue,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Pallete.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
