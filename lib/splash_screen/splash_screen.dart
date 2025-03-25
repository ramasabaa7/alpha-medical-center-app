import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/splash_screen/spash_screen_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Splash_screen extends StatelessWidget {
  const Splash_screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Splash_controller controller =Get.put(Splash_controller());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.white, StaticColor.primarycolor])),
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Image.asset(
             // "assets/images/splash.png",
              "assets/images/logo.png"
                  ,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
