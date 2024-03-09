import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoodeye/constants/colors.dart';
// import 'package:flutter_sms/flutter_sms.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Pallete.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Pallete.grey)),
            icon: Icon(
              CupertinoIcons.back,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ));
  }
}
