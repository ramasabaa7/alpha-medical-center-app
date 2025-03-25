import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/add_result/add_result_services.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/Edit_perview_result/edit_preview_result_services.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/edit_visit/edit_visit_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/edit_previous_medical_condition/edit_previous_medical_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_previous_medical_controller extends GetxController {
  GlobalKey<FormState> formstate4 = GlobalKey<FormState>();
  late String DiseaseName;
  late String Details;
  late int id;
  late int patientrecord;
  Edit_previous_medical_services services = Edit_previous_medical_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var token;
  String? Function(String?)? valid;

  checkinput() {
    var formdata = formstate4.currentState;
    if (formdata!.validate()) {
      edit_previous_medical();
    } else {
      print("الحقول غير صالحة");
    }
  }

  edit_previous_medical() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.edit_previous_medical(
        id, patientrecord, DiseaseName, Details);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل السوابق المرضية بنجاح",
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
    patientrecord=Get.arguments['patientrecord'];
    super.onInit();
  }
}
