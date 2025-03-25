import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/modules/manager/home/profile_info_managment/profile_info_managmet_services.dart';
import 'package:project_after_update/modules/reception/home/profile_info/profile_info_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Profile_info_managment_controller extends GetxController {
  Profile_info_managment_services services = Profile_info_managment_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late String id_patient;
  List data_details=[];
  List test_data=[];


  get_user_info() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_user_info();
    test_data.addAll(response.values) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data_details.clear();
      data_details.addAll(response.values) ;
      // Get.toNamed("/patient_details");
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد بيانات لعرضها",
      );

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
    get_user_info();
    super.onInit();
  }
}
