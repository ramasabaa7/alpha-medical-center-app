import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../../modules/x-Ray/VisitsListsX_Ray/VisitsListControllerX_Ray.dart';

class VisitListX_raybinding implements Bindings{
  @override
  void dependencies() {
    Get.put<VisitsListControllerX_Ray>(VisitsListControllerX_Ray());
  }}