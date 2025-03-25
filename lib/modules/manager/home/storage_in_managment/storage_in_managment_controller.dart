

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/financial/financial_material/finance_material_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/modules/manager/home/storage_in_managment/storage_in_managment_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Storage_in_managment_controller extends GetxController {
  Storage_in_managment_services services =
  Storage_in_managment_services(Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data = [];
  List test_data = [];
  List test_data_user=[];
  List data_user=[];
  List test_data_type_section=[];
  List data_type_section=[];
  late var price;
  late int section_id;
  get_all_material_in_center() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_material_in_center();
    test_data.addAll(response['data']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest && test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']);
      print("response from get all section controller");
      print(data);
    } else if (test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد مواد لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد مواد لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_all_user() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_user(section_id);
    test_data_user.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_user.isNotEmpty) {
      data_user.clear();
      data_user.addAll(response['data']) ;
      print(data);
    }
    else if(test_data_user.isEmpty) {
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
        "لا يوجد انواع خدمات لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد إنواع خدمات لعرضهم",
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
  void onInit(){
    section_id= Get.arguments['id_section'];
    get_all_material_in_center();
    get_all_type_of_section();
    get_all_user();

    super.onInit();
  }
}
