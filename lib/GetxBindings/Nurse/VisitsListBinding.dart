import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/VisitsListController.dart';
class VisitsListBinding implements Bindings{
  @override
  void dependencies() {
   Get.put<VisitsListController>(VisitsListController())  ;
   }
}