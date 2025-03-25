import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_services.dart';
import 'package:project_after_update/modules/reception/home/all_employee_reception/all_employee_reception_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class all_employee_controller extends GetxController {
  all_employee_reception_services services =
      all_employee_reception_services(Get.find(), Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();

  List data = [];
  List test_data = [];

  late var droped;

  ontapdropdown(bool droped) {
    update();
    this.droped = droped;
    update();
  }
  // detectvalue_of_droped(int int_droped){
  //   if(int_droped==1){
  //     droped=true;
  //   }else{
  //     droped=false;
  //   }
  // }

  get_all_user_status() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_user_status();
    test_data.addAll(response['data']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest && test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']);
      print("response from patient controller");
    } else if (test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد موظفين لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد موظفين لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " تنبيه", content: Text("حدث خطا ما"));
    }
    update();
  }
  change_status(int user_id,int int_droped) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.change_status(user_id,int_droped);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل حالة المستخدم  بنجاح",
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
  void onInit() {
    get_all_user_status();

  }
}
