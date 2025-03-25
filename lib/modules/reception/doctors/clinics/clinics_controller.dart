


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/clinics_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Clinics_controler extends GetxController {
  Clinics_services services = Clinics_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  late int id_section;

  get_all_clinics() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_clinics(id_section);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.addAll(response['data']) ;
      print("response from patient controller");
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد أطباء لعرضههم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد أطباء لعرضههم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  @override
  void onInit() {
     id_section=Get.arguments['id_section'];
     print("from controller id section is ${id_section}");
    get_all_clinics();
  }}