

import 'package:get/get.dart';
import 'package:project_after_update/modules/Lab/EditVistlab/EditVisitlabController.dart';

class EditVisitlabBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<EditVisitlabController>(EditVisitlabController());
  }}