import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/reservations/reservations_services.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/wating_in_clinics/wating_in_clinics_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_visits/patient_visits_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Reservations_controller extends GetxController {
  Reservations_services services = Reservations_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  List patinet_info=[];
  List test_patient_info=[];
  late String id_doctor;

  get_doctor_reservations() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_doctor_reservations(id_doctor);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد مواعيد لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "${response['message']}",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_patient_info(int id_patient) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_patient_info_by_id(id_patient);
    test_patient_info.addAll(response['data'].values) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_patient_info.isNotEmpty) {
      patinet_info.clear();
      patinet_info.addAll(response['data'].values) ;
      print("the beauti name of patient is ${patinet_info}");
    }
    else if(test_patient_info.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد بيانات لعرضها",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد بيانات لعرضها",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  delete_patient_reservation(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_patient_reservation(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");

    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
    //  Get.defaultDialog(title: " تم", content: Text("حدث خطا ما"));
    }
    update();
  }
  @override
  void onInit() async{
    id_doctor= await Get.arguments['id_doctor_to_show_res'];
    get_doctor_reservations();
  }
}
