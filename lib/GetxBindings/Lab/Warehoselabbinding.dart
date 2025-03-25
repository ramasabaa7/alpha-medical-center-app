

import 'package:get/get.dart';

import '../../modules/Lab/Warehose/warehouseControllerlab.dart';

class warehouselabbinding implements Bindings
{
  @override
  void dependencies() {
    Get.put<warehouseControllerlab>(warehouseControllerlab());
  }

}