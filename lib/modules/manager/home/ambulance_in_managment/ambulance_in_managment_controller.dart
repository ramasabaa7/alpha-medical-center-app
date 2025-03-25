

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/ambulance_in_managment/ambulance_in_managment_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/display_users_in_reception_services.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Ambulance_in_managment_controller extends GetxController {
  bool droped = false;
  Ambulance_in_managment_services services = Ambulance_in_managment_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  List data_type_section=[];
  List test_data_type_section=[];
  late int section_id;
  ontapdropdown(bool droped) {
    this.droped = !droped;
    update();
  }
  bool droped_two = false;

  ontapdropdown_two(bool droped_two) {
    this.droped_two = !droped_two;
    update();
  }
  get_all_user() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_user(section_id);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد موظفين لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد موظفين لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_all_type_of_section() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_type_of_section(section_id);
    test_data_type_section.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_type_section.isNotEmpty) {
      data_type_section.clear();
      data_type_section.addAll(response['data']) ;
      print("response from get all section controller");
      print(data_type_section);
    }
    else if(test_data_type_section.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد خدمات إسعاف لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد خدمات إسعاف لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_type(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_type(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
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


  @override
  void onInit()async{
    section_id= Get.arguments['id_section'];
    await get_all_type_of_section();
    get_all_user();
  }
}
