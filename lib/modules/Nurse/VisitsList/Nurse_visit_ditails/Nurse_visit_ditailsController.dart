
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/Nurse_visit_ditails/Nurse_visit_ditailsServices.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';


import 'dart:io';
import 'dart:io';

import 'package:http/http.dart' as http;



class Nurse_visit_ditailsController extends GetxController {
  Nurse_visit_ditailsServices services = Nurse_visit_ditailsServices(Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List data_download=[];



  go_to_edit(){
    Get.toNamed("/EditVisitDetailsNures",arguments: {
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
      Get.toNamed("/VisitsListNurse");
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
  // downloadX_Rays(int id) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await services.downloadX_Rays(id);
  //
  //   if (response != null) {
  //     final dir = await getTemporaryDirectory();
  //     final file = File('${dir.path}/images.png');
  //     await file.writeAsBytes(response);
  //     final params = SaveFileDialogParams(sourceFilePath: file.path);
  //     final path = await FlutterFileDialog.saveFile(params: params);
  //
  //     if (path != null) {
  //       Get.snackbar(
  //         "تم",
  //         "تم تحميل الصورة",
  //       );
  //     } else {
  //       Get.snackbar(
  //         "تحذير",
  //         "لم يتم تحميل الصورة",
  //       );
  //     }
  //   } else {
  //     Get.snackbar(
  //       "تحذير",
  //       "لم يتم تحميل الصورة",
  //     );
  //   }
  //
  //   update();
  // }

////






}
