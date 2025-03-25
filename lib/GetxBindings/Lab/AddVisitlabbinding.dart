
import 'package:get/get.dart';
import 'package:project_after_update/modules/Lab/AddVisit/Addvisitcontrollerlab.dart';

class Addvisitalabbinding implements Bindings{
  @override
  void dependencies() {
    Get.put<Addvisitcontrollerlab>(Addvisitcontrollerlab());
  }}