import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_after_update/modules/Nurse/Home/homeNurseServices.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'dart:collection';

class Nurse_wait_patient_controller extends GetxController {
  var notificationCount = 0.obs;
  var isStoping = false.obs;

  void toggleStop() {
    isStoping.value = !isStoping.value;
  }

  void incrementNotificationCount() {
    notificationCount.value++;
  }

  homeNurseServices services =
  homeNurseServices(Get.find(), Get.find(), Get.find(), Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  StatusRequest? statusRequest3;

  Secury_storage secury_storage = new Secury_storage();


  List data= [];

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

  }


  get_allwaitingPatient(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest}");
    var response = await services.get_allwaitingPatient(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data.clear();
      data.addAll(response['data']);
      print(response);
      print("doneWait");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ماwait"));
    }
    update();
  }
  bool isFilterOn =true;
  changstatuslabbyidservic(int status ) async {
    statusRequest3 = StatusRequest.loading;
    update();

    var response = await services.changstatuslabbyidservice(status);
    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {
      if(status==0){
        Get.defaultDialog(title: "", content: Text("تم إيقاف طلبات التحويل"));}
      else {
        Get.defaultDialog(title: "", content: Text("تم استئناف طلبات التحويل"));

      }


    }

    else if (StatusRequest.failure == statusRequest3) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();












  }


}
