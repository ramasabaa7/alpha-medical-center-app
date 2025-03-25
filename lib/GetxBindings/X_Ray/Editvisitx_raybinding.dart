import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../../modules/x-Ray/EditVisitX_ray/EditVisitNurseController.dart';

class Editvisitingx_raybinding implements Bindings{
  @override
  void dependencies() {
    Get.put<EditVisitX_RayController>(EditVisitX_RayController());
  }}