import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/Payments_and_Receipts/payments_services.dart';
import 'package:project_after_update/modules/financial/Receipts/Receipts_services.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/financial/maintenance/maintenace_services.dart';
import 'package:project_after_update/modules/financial/maintenance/payments_for_maintenance/payments_for_maintenance_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Payments_controller extends GetxController {
  Payments_services services =
  Payments_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data = [];
  List test_data = [];


  get_all_payments_maintenance_request() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_payments_maintenance_request();
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
        "لا يوجد مدفوعات صيانة لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد مدفوعات صيانة لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  @override
  void onInit() {
    get_all_payments_maintenance_request();
    super.onInit();
  }
}
