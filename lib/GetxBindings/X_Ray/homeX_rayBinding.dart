import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../modules/x-Ray/home/homeX-RayController.dart';

class homex_rayBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<homex_rayController>(homex_rayController());
  }}