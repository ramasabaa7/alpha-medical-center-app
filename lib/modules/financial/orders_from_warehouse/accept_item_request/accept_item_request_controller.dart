import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/accept_item_request/accept_item_request_services.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Accept_item_request_controller extends GetxController {

  DateTime today = DateTime.now();
  DateTime today1 = DateTime.now();
  DateTime today2 = DateTime.now();

 // TimeOfDay time1 = TimeOfDay(hour: 08,minute: 30);

  void ondayselected(DateTime day, DateTime focusedday) {
    today = day;
    update();
  }
  void ondayselected1(DateTime day, DateTime focusedday) {
    today1 = day;
    update();
  }
  void ondayselected2(DateTime day, DateTime focusedday) {
    today2 = day;
    update();
  }




  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late String month;
  late String day;

  late String month1;
  late String day1;

  late String month2;
  late String day2;


  //late String bookingdate;
  late String production;
  late String expiry;
  late String create;

  late var item_id;
  Acceept_item_request_services services = Acceept_item_request_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  String? Function(String?)? valid;
  checkinput() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      accept_item_request();
    } else {
      print("الحقول غير صالحة");
    }
  }

  accept_item_request() async {
    // print("the doctor id in the add reservation controller is ${id_doctor}");
   // bookingdate=bookingday+'/'+bookingtime;
  //  print("booooking is  ${bookingdate}");
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await services.add_reservation(item_id, production, expiry,create);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم الحجز بنجاح",
        "تمت قبول الطلب بنجاح",
      );

    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم يتم قبول الطلب",
      );
    } else {
      Get.defaultDialog(
          title: "حدث خطأ ما", content: Text("لم يتم قبول  الطلب "));
    }
    update();
  }
  @override
  void onInit() {
    item_id=Get.arguments['item_id'];
  }

}

