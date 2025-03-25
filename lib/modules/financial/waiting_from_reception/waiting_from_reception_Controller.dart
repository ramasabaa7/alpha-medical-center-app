import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/wating_from_reception_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_services/patient_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Wating_from_reception_controller extends GetxController {
  Wating_from_reception_services services = Wating_from_reception_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late String name;
  late int id_patient_record;
  List data_details=[];
List test_data_details=[];

  get_required_services() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_required_service();
    test_data_details.addAll(response['data']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&&test_data_details.isNotEmpty) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      // Get.toNamed("/patient_details");
    }
    else if(test_data_details.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد حالات تحويل لعرضها",
      );

    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد حالات تحويل لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  // delete_service_for_patienr(int id) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await services.delete_service_for_patient(id);
  //
  //   statusRequest = handlingdata(response);
  //
  //   if (StatusRequest.succes == statusRequest) {
  //     await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
  //   } else if (StatusRequest.failure == statusRequest) {
  //     await Get.snackbar(
  //       "تنبيه",
  //       "لم تتم عملية الحذف",
  //     );
  //   } else {
  //     Get.defaultDialog(title: " تم", content: Text("تمت عملية الحذف بنجاح"));
  //   }
  //   update();
  // }
  @override
  void onInit() {
    get_required_services();
    super.onInit();
  }

}
