import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/ambulance_patient_visits_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Ambulance_Patient_visits_details_controller extends GetxController {
  Ambulance_Patient_visits_details_services services = Ambulance_Patient_visits_details_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];


  go_to_edit(){
    Get.toNamed("/Edit_preview_result",arguments: {
      "Pressure" :data[0]['Pressure'].toString(),
      "Heartbeat" : data[0]['Heartbeat'].toString(),
      "BodyHeat" : data[0]['BodyHeat'].toString(),
      "ClinicalStory" : data[0]['ClinicalStory'].toString(),
      "ClinicalExamination" : data[0]['ClinicalExamination'].toString(),
      "Comments" : data[0]['Comments'].toString(),
      "id" : data[0]['id']

    });
  }
  get_patient_visits_details(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_patient_visits_details(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data.clear();
      data.addAll(response['data']) ;
      print("response from patient controller");
      print(data);
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد تفاصيل لعرضها",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  //////////////////////////////
  delete_patient_visits_details(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_patient_visits_details(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
      Get.toNamed("/Ambulance_patients_visits");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية الحذف",
      );
    } else {
      Get.defaultDialog(title: " تم", content: Text("تمت عملية الحذف بنجاح"));
    }
    update();
  }

}
