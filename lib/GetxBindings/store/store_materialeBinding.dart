import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/warehouse/warehouseController.dart';

import '../../modules/store/home_store/warehouseControllerstor.dart';
class stormaaterialBindinds implements Bindings
{
  @override
  void dependencies() {
    Get.put<warehouseControllerstor>(warehouseControllerstor());
  }

}