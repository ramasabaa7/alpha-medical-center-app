import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/Modules/x-Ray/warehose/products.dart';
import 'package:project_after_update/modules/store/Orders/sectionservic.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import 'order.dart';

class departmentorderController extends GetxController{
  StatusRequest? statusRequest;
  sectionservc service =sectionservc(Get.find());
  var data_details =[];

  var selectedValue = 'Option 1'.obs;
  var dropdownValues = ['Option 1', 'Option 2', 'Option 3'].obs;
  getsection() async {
    statusRequest = StatusRequest.loading;
    update();
    statusRequest =handlingdata(statusRequest);
    var response = await service.get_section();
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      print( data_details);

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


  onInit() {
    getsection();
    super.onInit();
  }

}