import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../../secure_storage/secure_storage.dart';

import 'homeService.dart';
class  homex_rayController extends GetxController{

  homeService service = new homeService(Get.find(),Get.find(),Get.find());
  homeService services = homeService(Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  StatusRequest? statusRequest4;
  StatusRequest? statusRequest8;
  Secury_storage secury_storage = new Secury_storage();
  late int index ;
  String detaile = "";
  //late String id_patient;
  //List test_data=[];
  List data_details=[];
  var notificationCount = 0.obs;
  var isStoping = false.obs;

  void toggleStop() {
    isStoping.value = !isStoping.value;
  }

  void incrementNotificationCount() {
    notificationCount.value++;
  }
  get_typescion() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await services.get_allTypeofsection();

    //test_data.addAll(response['data']);
    // print("test daaaataaa is ${test_data}");
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee ${data_details.length}");

    }

    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }

  @override
  void onInit() {
    get_typescion();
    super.onInit();
  }
  logout() async {
    statusRequest8 = StatusRequest.loading;
    update();
    var response = await services.logout();
    // test_data.addAll(response['data']) ;
    statusRequest8 = handlingdata(response);

    if (StatusRequest.succes == statusRequest8) {
      await Get.snackbar(
        "تم",
        "تم تسجيل الخروج بنجاح",
      );
      FirebaseMessaging.instance.unsubscribeFromTopic("doctor");
      secury_storage.delete();

      Get.offAllNamed("/login");

    }
    else if (StatusRequest.failure == statusRequest8) {
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
  increment_requrst_Salary() async {
    statusRequest4 = StatusRequest.loading;
    update();
    var response = await services.increment_requrst_Salary(detaile);
    statusRequest4 = handlingdata(response);

    if (StatusRequest.succes == statusRequest4) {
      await Get.snackbar(
        "ملاحظة ",
        "تم إرسال الطلب بنجاج",
      );
    } else if (StatusRequest.failure == statusRequest4) {
      await Get.snackbar(
        "تنبيه",
        "فشل إرسال الطلب",
      );
    } else {
      Get.defaultDialog(title: " خطأ ", content: Text("حدث خطأ ما"));
    }
    update();
  }

}