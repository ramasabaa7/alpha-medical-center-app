import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/x-Ray/warehose/warehouseController.dart';

class WarehouseBindinds implements Bindings
{
  @override
  void dependencies() {
    Get.put<warehouseController>(warehouseController());
  }

}