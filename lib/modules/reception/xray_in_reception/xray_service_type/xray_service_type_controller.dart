
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/xray_in_reception/xray_service_type/xray_service_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Xray_service_type_controller extends GetxController{
  Xray_service_type_services services = Xray_service_type_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  late int id_section;



  get_all_type_of_section() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_type_of_section(id_section);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("response from get all section controller");
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد صور لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد صور لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  @override
  void onInit() {
    id_section=Get.arguments['id_section'];
    get_all_type_of_section();

    super.onInit();
  }
}