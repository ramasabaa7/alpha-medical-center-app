import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/add_result/add_result_services.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/Edit_perview_result/edit_preview_result_services.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/edit_visit/edit_visit_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_visit_controller extends GetxController {
  GlobalKey<FormState> formstate3 = GlobalKey<FormState>();
  late String title;
  late String referringphysician;
  late int id;
  late int idpatientrecord;
  Edit_visit_services services = Edit_visit_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var token;
  String? Function(String?)? valid;

  checkinput() {
    var formdata = formstate3.currentState;
    if (formdata!.validate()) {
      edit_visit();
    } else {
      print("الحقول غير صالحة");
    }
  }

  edit_visit() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.edit_visit(
        id, idpatientrecord, title, referringphysician);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل الزيارة بنجاح",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم يتم التعديل",
      );
    } else {
      Get.defaultDialog(title: " خطأ ", content: Text("حدث خطأ ما"));
    }
    update();
  }

  @override
  void onInit() {
    id = Get.arguments['id'];
    idpatientrecord=Get.arguments['idpatientrecord'];
    super.onInit();
  }
}
