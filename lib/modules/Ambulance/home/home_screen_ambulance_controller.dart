
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients.dart';
import 'package:project_after_update/modules/Ambulance/home/home_screen_ambulamce_services.dart';
import 'package:project_after_update/modules/Ambulance/request_consumable/request_consumable.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Home_screen_ambulance_controller extends GetxController{
  Home_screen_ambulance_services services= new Home_screen_ambulance_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  int currentpage=0;
  List<Widget> listpage=[
    const Ambulance_patients(),
    Text("تسجيل حالة"),
   const Request_consumable(),
    Text("الاعدادات"),

  ];
  changepage(int i){
    currentpage=i;
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
      Get.toNamed("/login");

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