import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/center_services/center_services.dart';
import 'package:project_after_update/modules/reception/home/home_reception.dart';
import 'package:project_after_update/modules/reception/home/home_screen_reception_services.dart';
import 'package:project_after_update/modules/reception/home/setting/setting.dart';
import 'package:project_after_update/modules/reception/notification/notification.dart';
import 'package:project_after_update/modules/reception/patient/patient.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Home_screen_reception_controller extends GetxController{
  Home_screen_reception_services services = Home_screen_reception_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();


  int currentpage=0;
  List<Widget> listpage=[
    const Home_reception(),
    const Patient(),
    const Setting(),
    const Notifications()

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
      FirebaseMessaging.instance.unsubscribeFromTopic("reception");
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