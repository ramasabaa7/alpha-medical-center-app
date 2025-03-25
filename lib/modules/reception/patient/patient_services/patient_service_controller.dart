import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/patient/patient_services/patient_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Patient_service_controller extends GetxController {
  Patient_service_services services = Patient_service_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late String name;
  late int id_patient_record;
  List data_details=[];
  checkinput() {

    get_patient_service();

  }



  get_patient_service() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_required_service(id_patient_record);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      // Get.toNamed("/patient_details");
    }
    // else if(test_data.isEmpty) {
    //   await Get.snackbar(
    //     "تحذير",
    //     "لا يوجد بيانات لعرضها",
    //   );
    //
    // }
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
  delete_service_for_patienr(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_service_for_patient(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية الحذف",
      );
    } else {
      Get.defaultDialog(title: " تم", content: Text("تمت عملية الحذف بنجاح"));
    }
    update();
  }
@override
  void onInit() {
    name=Get.arguments['name'];
    id_patient_record=Get.arguments['id_patient_record'];
    get_patient_service();
    super.onInit();
  }

}
