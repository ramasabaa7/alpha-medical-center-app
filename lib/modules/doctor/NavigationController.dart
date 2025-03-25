import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/Modules/doctor/Home/Home.dart';
import 'package:project_after_update/Modules/doctor/bookings/DoctorBooking.dart';
class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var textValue = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void increaseVlaue() {
    textValue.value++;
  }
}