

import 'package:get/get.dart';
import 'package:project_after_update/modules/Lab/home/homelabController.dart';

class homelabBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<homelabController>(homelabController());
  }}