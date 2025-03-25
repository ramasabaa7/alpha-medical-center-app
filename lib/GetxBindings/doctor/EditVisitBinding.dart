import 'package:get/get.dart';
import 'package:project_after_update/modules/doctor/EditVisit/EditVisitController.dart';
class EditVisitBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<EditVisitController>(EditVisitController());
  }


}