import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/employee/employee.dart';
import 'package:project_after_update/modules/manager/home/Setting_managment.dart';
import 'package:project_after_update/modules/manager/home/home_manager.dart';
import 'package:project_after_update/modules/manager/home/home_screen_manager_services.dart';
import 'package:project_after_update/modules/manager/home/new_section/add_new_section.dart';
import 'package:project_after_update/modules/manager/join_request/join_request.dart';
import 'package:project_after_update/modules/reception/home/setting/setting.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Home_screen_manager_controller extends GetxController {

  Home_screen_manager_services services = Home_screen_manager_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  int currentpage = 0;
  List<Widget> listpage = [
    const Home_manager(),
    Join_request(),
    const Setting_managment(),
   const Add_new_section(),
  ];
  changepage(int i) {
    currentpage = i;
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
}
