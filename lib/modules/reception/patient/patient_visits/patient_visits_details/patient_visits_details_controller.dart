import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/patient/patient_visits/patient_visits_details/patient_visits_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Patient_visits_details_controller extends GetxController {
  Patient_visits_details_services services =
      Patient_visits_details_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data = [];
 // late int id_patient_visit;
 // late String referingphisic;

  get_patient_visits_details(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_patient_visits_details(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data.clear();
      data.addAll(response['data']);
      print("response from patient controller");
      print(data);
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد تفاصيل لعرضها",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  download_xray(int id) async {
    update();
    var response = await services.download_xray(id);
    statusRequest = StatusRequest.loading;
    if (services.finalpath != null) {
      Get.snackbar("تنبيه", "تم تحميل الصورة بنجاح");
    } else {
      Get.snackbar("تنبيه", "لم تم تحميل الصورة بنجاح");
    }
    update();
  }

  @override
  void onInit(){
   // id_patient_visit = Get.arguments['id'];
  //  referingphisic = Get.arguments['referingphisic'];
  //  get_patient_visits_details();
    super.onInit();
  }
}
