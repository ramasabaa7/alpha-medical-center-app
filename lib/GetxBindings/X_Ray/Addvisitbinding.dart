import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../../modules/x-Ray/AddVisit/AddvisitcontrollerX_ray.dart';

class AddvisitaX_raybinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AddvisitcontrollerX_ray>(AddvisitcontrollerX_ray());
  }}