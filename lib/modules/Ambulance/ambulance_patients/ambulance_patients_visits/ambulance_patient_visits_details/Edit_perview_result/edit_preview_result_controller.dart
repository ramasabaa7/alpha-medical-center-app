import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/add_result/add_result_services.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/Edit_perview_result/edit_preview_result_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_preview_result_controller extends GetxController {
  GlobalKey<FormState> formstate2 = GlobalKey<FormState>();
  late String Pressure;
  late String Heartbeat;
  late String BodyHeat;
  late String ClinicalStory;
  late String ClinicalExamination;
  late String comments;
  late String hint_Pressure;
  late String hint_Heartbeat;
  late String hint_BodyHeat;
  late String hint_ClinicalStory;
  late String hint_ClinicalExamination;
  late String hint_comments;
  late int id;
  Edit_preview_result_services services =
      Edit_preview_result_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var token;
  String? Function(String?)? valid;

  checkinput() {
    var formdata = formstate2.currentState;
    if (formdata!.validate()) {
      edit_result();
    } else {
      print("الحقول غير صالحة");
    }
  }

  edit_result() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.edit_result(Pressure, Heartbeat, BodyHeat,
        ClinicalStory, ClinicalExamination, comments,id);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل المعاينة بنجاح",
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
    hint_Pressure = Get.arguments['Pressure'];
    hint_Heartbeat = Get.arguments['Heartbeat'];
    hint_BodyHeat = Get.arguments['BodyHeat'];
    hint_ClinicalStory = Get.arguments['ClinicalStory'];
    hint_ClinicalExamination = Get.arguments['ClinicalExamination'];
    hint_comments = Get.arguments['Comments'];
    id =Get.arguments['id'];

    super.onInit();
  }
}
