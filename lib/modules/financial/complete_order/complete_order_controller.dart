import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/fcmconfig.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/complete_order/complete_order_services.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_services.dart';
import 'package:project_after_update/modules/financial/financial_material/finance_material_services.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_services.dart';
import 'package:project_after_update/modules/manager/home/home_manager_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Complete_order_controller extends GetxController {
  Complete_order_services services =
  Complete_order_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data = [];
  List test_data = [];
  late var price;
  get_all_orders_complete() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_order_complete();
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

  // update_material_price(id_material) async{
  //   print("from update material service the id is ${id_material}");
  //   statusRequest=StatusRequest.loading;
  //   update();
  //   var response =await services.update_material_price(id_material,price);
  //
  //   statusRequest=handlingdata(response);
  //
  //   if(StatusRequest.succes==statusRequest){
  //
  //     await Get.snackbar("تم التعديل بنجاح", "تمت عملية تعديل السعر بنجاح",);
  //
  //
  //
  //   }else if(StatusRequest.failure==statusRequest){
  //     await Get.snackbar("تنبيه", "لم يتم تعديل السعر ");
  //   }
  //   else{
  //     Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تعديل السعر"));
  //   }
  //   update();
  // }
  @override
  void onInit(){
    get_all_orders_complete();
    super.onInit();
  }
}
