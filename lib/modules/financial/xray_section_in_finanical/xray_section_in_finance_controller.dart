

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/clinics_section_in_finanical/clinics_section_in_finance_services.dart';
import 'package:project_after_update/modules/financial/finance_section_in_finanical/finance_section_in_finacne_services.dart';
import 'package:project_after_update/modules/financial/xray_section_in_finanical/xray_section_in_finance_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/display_users_in_reception_services.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Xray_section_in_finance_controller extends GetxController {
  bool droped = false;
  Xray_section_in_finance_services services = Xray_section_in_finance_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  List data_type_section=[];
  List test_data_type_section=[];
  late int section_id;
  late var salary;
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
  edit_salary(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.edit_salary(id,salary);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل  الراتب  بنجاح",
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
  void onInit()async{
    section_id= Get.arguments['id_section'];
    get_all_user();
  }
}
