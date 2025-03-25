import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/Receipts/Receipts_services.dart';
import 'package:project_after_update/modules/financial/Receipts/bill_details_in_receipts/bill_details_in_receipts_services.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class bill_details_in_receipts_controller extends GetxController {
  bill_details_in_receipts_services services =
  bill_details_in_receipts_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late int bill_id;

  List data_details = [];
  List test_data_details = [];


  get_bill_details() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_bill_details(bill_id);
    test_data_details.addAll(response['data'].values);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest && test_data_details.isNotEmpty) {
      data_details.clear();
      data_details.addAll(response['data'].values);
      print("response from get all section controller");
      print(data_details);
    } else if (test_data_details.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد تفاصيل لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد تفاصيل لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  @override
  void onInit() {
    bill_id=Get.arguments['bill_id'];
    get_bill_details();
    super.onInit();
  }
}
