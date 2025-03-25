import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/doctor/record/patientVisitRecordController.dart';

class patientVisitRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<patientVisitRecordController>(patientVisitRecordController());
  }
}
