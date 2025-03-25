import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/doctor/Home/Doctor_home_services.dart';
import 'package:project_after_update/modules/doctor/Home/home_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:project_after_update/core/function/handlingdata.dart';

class homeController extends GetxController{


  bool isFilterOn =true.obs as bool;

  Doctor_home_services services = Doctor_home_services(Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find());

  StatusRequest? statusRequest;
  StatusRequest? statusRequest3;
  StatusRequest? statusRequest2;
  StatusRequest? statusRequest4;
  StatusRequest? statusRequest8;
  StatusRequest? statusRequest5;


  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List data2=[];
  String detaile = "";

  var notificationCount = 0.obs;
  var isStoping = false.obs;

  void toggleStop() {
    isStoping.value = !isStoping.value;
  }

  void incrementNotificationCount() {
    notificationCount.value++;
  }
  get_allwaitingPatient(int id_TypeCenterServices) async {
    statusRequest = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest}");
    var response = await services.get_allwaitingPatient(id_TypeCenterServices);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {

      data.clear();
      data.addAll(response['data']) ;
      print(response);
      print("doneWait");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ماwait"));
    }
    update();
  }
  @override
  void onInit() {
    get_my_user();

    super.onInit();
  }
  changstatuslabbyidservic(int status ) async {
    statusRequest3 = StatusRequest.loading;
    update();

    var response = await services.changstatuslabbyidservice(status);
    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {
      if (status == 0) {
        Get.defaultDialog(title: "", content: Text("تم إيقاف طلبات التحويل"));
      }
      else {
        Get.defaultDialog(title: "", content: Text("تم استئناف طلبات التحويل"));
      }
    }
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
  get_my_user() async {
    statusRequest2 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest2}");
    var response = await services.get_my_user_info();

    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {

      data2.clear();
      data2.add(response['data']) ;
      print(response);
      print("get information");
      get_allwaitingPatient(data2[0]['id_TypeCenterServices']);

    } else if (StatusRequest.failure == statusRequest2) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ماwait"));
    }
    update();
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

  complet(int id ) async {
    statusRequest5 = StatusRequest.loading;
    update();

    var response = await services.complete(id);
    statusRequest5 = handlingdata(response);

    if (StatusRequest.succes == statusRequest5)
       Get.defaultDialog(title: "", content: Text("تمت إزالة المريض من الدور"));
    else
        Get.defaultDialog(title: "", content: Text("حدث خطأ ما "));


  }
}