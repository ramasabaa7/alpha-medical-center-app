import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/doctor/Home/homeController.dart';

class HomeDoctorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<homeController>(homeController());
  }
}
