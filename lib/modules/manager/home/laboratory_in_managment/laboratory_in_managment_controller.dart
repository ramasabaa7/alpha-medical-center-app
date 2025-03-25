import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_in_managment_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Laboratory_in_managment_controller extends GetxController{
  bool droped = false;
  Laboratory_in_managment_services services = Laboratory_in_managment_services(Get.find(),Get.find());
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
        "لا يوجد تحاليل لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد تحاليل لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_analysis_type(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_analysis_type(id);

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
    id_section=Get.arguments['id_section'];
    get_all_type_of_section();

    super.onInit();
  }
  ontapdropdown(bool droped) {
    this.droped = !droped;
    update();
  }
  bool droped_two = false;

  ontapdropdown_two(bool droped_two) {
    this.droped_two = !droped_two;
    update();
  }
}