import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';

import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/doctor/record/patientVisitRecordServices.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class patientVisitRecordController extends GetxController{
  var is_doctortransfer = true.obs;

  RxList<bool> showDetails = List.filled(100, false).obs;

  toggleDetails(int index) {
    showDetails[index] = !showDetails[index];
    update();

  }

  var doctor = false.obs;

  patientVisitRecordServices services = patientVisitRecordServices(Get.find(),Get.find());
  StatusRequest? statusRequest;
  StatusRequest? statusRequest2;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  List data2=[];
  List test_data2=[];
  get_patient_visits(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_patient_visits(id);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("this is patient viiiiisiiiits");
      print(data);
      //Get.toNamed("/Ambulance_patients_visits");
    }   else if(test_data.isEmpty) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد زيارات لعرضها",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد زيارات لعرضها",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  go_to_edit(int index ){
    Get.toNamed("/EditVisitDoctor"
        ,arguments: {
          "Pressure" :data[index]['Pressure'].toString(),
          "Heartbeat" : data[index]['Heartbeat'].toString(),
          "BodyHeat" : data[index]['BodyHeat'].toString(),
          "ClinicalStory" : data[index]['ClinicalStory'].toString(),
          "ClinicalExamination" : data[index]['ClinicalExamination'].toString(),
          "Comments" : data[index]['Comments'].toString(),
          "id" : data[index]['id']

        }
    );
  }
  get_patient_info(int id) async {
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await services.get_patient_info(id);
    // test_data2.addAll(response['data']) ;
    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {
      data2.clear();
      data2.add(response['data']) ;
      print("this is patient details");

      print(data2);
    }
    // else if(StatusRequest.failure == statusRequest2) {
    //   await Get.snackbar(
    //     "تحذير",
    //     "لا يوجد زيارات لعرضها",
    //   );
    // }
    else if (StatusRequest.failure == statusRequest2) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد زيارات لعرضها",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
// late int id ;
// @override
// void onInit() {
//   if (Get.arguments != null) {
//     if (Get.arguments['id'] != null)
//       id = Get.arguments['id'];
//   }
//   super.onInit();
// }


}