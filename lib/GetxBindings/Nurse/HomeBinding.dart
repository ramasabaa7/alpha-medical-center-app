import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/Home/homeNurseController.dart';


class HomeNurseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<homeNurseController>(homeNurseController());

  }


}