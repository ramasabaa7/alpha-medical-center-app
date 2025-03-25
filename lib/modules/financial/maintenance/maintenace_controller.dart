import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/Receipts/Receipts_services.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/financial/maintenance/maintenace_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Maintenance_controller extends GetxController {
  Maintenance_services services =
  Maintenance_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late int bill_id;
  List data = [];
  List test_data = [];


  get_all_maintenance_request() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_maintenance_request();
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
        "لا يوجد طلبات صيانة لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد طلبات صيانة لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_maintenance(int id_maintenance) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_maintenance_request(id_maintenance);

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
  void onInit() {
    get_all_maintenance_request();
    super.onInit();
  }
}
