
import 'package:get/get.dart';
import 'package:project_after_update/modules/Lab/VisitListLab/VisitsListControllerlab.dart';

class VisitListelabBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<VisitsListControllerlab>(VisitsListControllerlab());
  }}