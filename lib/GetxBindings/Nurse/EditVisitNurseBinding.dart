import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/modules/Nurse/EditVisitNurse/EditVisitNurseController.dart';
class EditVisitNurseBinding implements Bindings
{
  @override
  void dependencies() {
    Get.put<EditVisitNurseController>(EditVisitNurseController());
  }

}