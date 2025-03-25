import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/financial_home/finanical_home_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class financial_home_controller extends GetxController{

  StatusRequest? statusRequest;
  Finanical_home_services services= new Finanical_home_services(Get.find(),Get.find());
  Secury_storage secury_storage = new Secury_storage();
  var notificationCount = 0.obs;
late String id_patient ;
  List data = [];
  List test_data = [];
  checkinput() async{
    // var formdata=formstate.currentState;
    // if(formdata!.validate()){
    await get_all_patient_bills();

    // }else{
    //   print("الحقول غير صالحة");
    // }
  }
  void incrementNotificationCount() {
    notificationCount.value++;
  }
  get_all_patient_bills() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_patient_bills(id_patient);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data.clear();
      data.addAll(response['data']);
     Get.toNamed("/Patient_bills");
    } else if (StatusRequest.failure==statusRequest) {
       Get.snackbar(
        "تنبيه",
        "لا يوجد فواتير لعرضهم لهذا الرقم",
      );
    }
    else {
      Get.defaultDialog(title: " تنبيه", content: Text("حدث خطا ما "));
    }
    update();
  }
  pay_back(int id_bill) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.pay_back(id_bill);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      Get.snackbar(
        "تنبيه",
        "تمت عملية الإستعادة بنجاح ",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما لم تتم عملية الإستعادة"));
    }
    update();
  }
  logout() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.logout();
    // test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم",
        "تم تسجيل الخروج بنجاح",
      );
      secury_storage.delete();
      Get.offAllNamed("/login");

    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية تسجيل الخروج   ",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_bill(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_bill(id);

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
}