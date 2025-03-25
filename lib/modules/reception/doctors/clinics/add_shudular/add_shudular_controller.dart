// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:project_after_update/core/class/StatusRequest.dart';
// import 'package:project_after_update/core/function/handlingdata.dart';
// import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_services.dart';
// import 'package:project_after_update/modules/reception/doctors/clinics/add_shudular/add_shudular_services.dart';
// import 'package:project_after_update/secure_storage/secure_storage.dart';
//
// class Add_schedular_controller extends GetxController {
//   DateTime today = DateTime.now();
//   TimeOfDay time1 = TimeOfDay(hour: 08,minute: 30);
//   TimeOfDay time2 = TimeOfDay(hour: 08,minute: 30);
//
//   void ondayselected(DateTime day, DateTime focusedday) {
//     today = day;
//     update();
//   }
//
//   void ontimechanged(TimeOfDay time) {
//     time1 = time;
//     update();
//   }
//   void ontimechanged_two(TimeOfDay time) {
//     time2 = time;
//     update();
//   }
//   List<String> options = [
//     "الأحد",
//     "الإثنين",
//     "الثلاثاء",
//     "الأربعاء",
//     "الخميس",
//     "الجمعة",
//     "السبت",
//   ];
//   String selected="إختر الخدمة";
//   changedepartment(String value) {
//     selected = value;
//     update();
//   }
//   late var type;
//  // Rx<List<String>> selectedoptionlist = Rx<List<String>>([]);
//   var selectedoption = "".obs;
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//  // late String month;
//  // late String day;
//   late String hour;
//   late String minute;
//   late String hour_two;
//   late String minute_two;
//
//   late String id_personal;
//  // late String bookingdate;
//   late String bookingtime;
//   late String bookingtime_two;
//  //late String bookingday;
//   late var id_doctor;
//   Add_shudular_services services = Add_shudular_services(Get.find());
//   StatusRequest? statusRequest;
//   Secury_storage secury_storage = new Secury_storage();
//   late var message;
//   String? Function(String?)? valid;
//   // checkinput() {
//   //   var formdata = formstate.currentState;
//   //   if (formdata!.validate()) {
//   //     add_reservation();
//   //   } else {
//   //     print("الحقول غير صالحة");
//   //   }
//   // }
//
//   add_schudular() async {
//     // print("the doctor id in the add reservation controller is ${id_doctor}");
//    // bookingdate=bookingday+'/'+bookingtime;
//    // print("booooking is  ${bookingdate}");
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await services.add_schedular(id_doctor,type,bookingtime,bookingtime_two);
//
//     statusRequest = handlingdata(response);
//
//     if (StatusRequest.succes == statusRequest) {
//       await Get.snackbar(
//         "تم الحجز بنجاح",
//         "تمت عملية حجز الموعد بنجاح",
//       );
//     } else if (StatusRequest.failure == statusRequest) {
//       await Get.snackbar(
//         "تنبيه",
//         "${response['message']}",
//       );
//     } else {
//       Get.defaultDialog(
//           title: "حدث خطأ ما", content: Text("لم يتم إضافة السجل الطبي "));
//     }
//     update();
//   }
//   @override
//   void onInit() {
//     id_doctor=Get.arguments['id_doctor'];
//   }
//
// }
//
