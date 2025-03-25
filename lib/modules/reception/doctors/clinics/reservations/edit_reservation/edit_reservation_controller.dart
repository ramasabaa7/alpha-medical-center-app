import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_services.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/reservations/edit_reservation/edit_reservations_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_reservation_controller extends GetxController {
  DateTime today_edit = DateTime.now();
  TimeOfDay time1_edit = TimeOfDay(hour: 08,minute: 30);

  void ondayselected(DateTime day, DateTime focusedday) {
    today_edit = day;
    update();
  }

  void ontimechanged(TimeOfDay time) {
    time1_edit = time;
    update();
  }


  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late String month_edit;
  late String day_edit;
  late String minute_edit;
  late String hour_edit;
  late int id;
  late String bookingdate_edit;
  late String bookingtime_edit;
  late String bookingday_edit;
  Edit_reservation_services services = Edit_reservation_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  //late var message;
  String? Function(String?)? valid;
  checkinput() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      edit_reservation();
    } else {
      print("الحقول غير صالحة");
    }
  }

  edit_reservation() async {
    bookingdate_edit=bookingday_edit+'/'+bookingtime_edit;
    print("booooking is  ${bookingdate_edit}");
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await services.edit_reservation(id, bookingdate_edit);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم تعديل  الحجز بنجاح",
        "تمت عملية تعديل الحجز بنجاح",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      Get.defaultDialog(
          title: "حدث خطأ ما", content: Text("لم يتم عملية تعديل الحجز "));
    }
    update();
  }
  @override
  void onInit() {
    id=Get.arguments['id'];
    print("id from controller ${id}");
  }

}

