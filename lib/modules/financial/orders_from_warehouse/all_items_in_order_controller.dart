import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/financial/financial_material/finance_material_services.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/all_items_in_order_services.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class All_item_in_order_controller extends GetxController {
  All_item_in_order_services services =
  All_item_in_order_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data = [];
  List test_data = [];
  late var price;
  late var order_id;
  get_all_item_in_order() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_item_in_order(order_id);
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
        "لا يوجد طلبات لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد طلبات لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  reject_item_request(int item_id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.reject_item_request(item_id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تم", "تمت عملية رفض المادة  ");

    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      await Get.snackbar("تنبيه", "لم يتم  رفض المادة بنجاح");
      //  Get.defaultDialog(title: " تم", content: Text("حدث خطا ما"));
    }
    update();
  }
  @override
  void onInit(){
    order_id=Get.arguments['order_id'];
    get_all_item_in_order();
    super.onInit();
  }
}
