import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:project_after_update/modules/doctor/Doctor_following_nures/Doctor_following_nures.dart';
import 'package:project_after_update/modules/doctor/Home/home.dart';
import 'package:project_after_update/modules/doctor/bookings/DoctorBooking.dart';

import 'NavigationController.dart';
import 'package:fancy_bar/fancy_bar.dart';

class FancyNavBarPageDoctor extends StatelessWidget {
  FancyNavBarPageDoctor({Key? key}) : super(key: key);

  BottomNavigationController bottomNavigationController =
  Get.put(BottomNavigationController());

  final screens = [
    Home(),
     DoctorBooking(),
    Doctor_following_nures(),
    // Doctor_following_nures()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: bottomNavigationController.selectedIndex.value,
        children: screens,
      )),
      bottomNavigationBar: FancyBottomBar(
        items: [
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "المنزل",
            icon: Icon(Icons.home,color: Color(0xff9bb4fd)),
          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "المواعيد",
            icon: Icon(Icons.calendar_month_outlined,color: Color(0xff9bb4fd)),

          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "التمريض",
            icon: Icon(Icons.person_add_sharp,color: Color(0xff9bb4fd)),

          ),

        ],
        type: FancyType.FancyV2,
        onItemSelected: (index) {
          bottomNavigationController.changeIndex(index);
        },
        selectedIndex: bottomNavigationController.selectedIndex.value,
      ),
    );
  }
}