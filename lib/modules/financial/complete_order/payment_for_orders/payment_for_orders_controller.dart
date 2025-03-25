import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/Receipts/Receipts_services.dart';
import 'package:project_after_update/modules/financial/complete_order/payment_for_orders/payment_for_orders_services.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/financial/maintenance/maintenace_services.dart';
import 'package:project_after_update/modules/financial/maintenance/payments_for_maintenance/payments_for_maintenance_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Payments_for_orders_controller extends GetxController {
  Payments_for_orders_services services =
  Payments_for_orders_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late int bill_id;
  late int order_id;
  List data = [];
  List test_data = [];


  get_all_payments_orders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_payments_orders(order_id);
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
        "لا يوجد مدفوعات  لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد مدفوعات  لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_payments(int order_id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_payments(order_id);

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
    order_id=Get.arguments['order_id'];
    get_all_payments_orders();
    super.onInit();
  }
}
