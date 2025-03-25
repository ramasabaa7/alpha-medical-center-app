import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../Nurse/warehouse/products.dart';
import 'Accept.dart';
import 'getordersectionServic.dart';

class dep_ordercontroller extends GetxController{
  StatusRequest? statusRequest;
  getorderServic service =getorderServic(Get.find());
  Acceept_item_request_services  service22 = Acceept_item_request_services(Get.find());
  var data_details =[];
  var lenght ;
  late var id ;

  var selectedValue = 'Option 1'.obs;
  var dropdownValues = ['Option 1', 'Option 2', 'Option 3'].obs;
  get_order() async {

    statusRequest = StatusRequest.loading;
    update();
    statusRequest =handlingdata(statusRequest);
    var response = await service.get_ordersectin(id);
    print(response);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      print('eeeeeeeeeeeeeeeeeeeeeeee');
      print( data_details.length);

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
  acceptmatirial4(int id) async {

    var response = await service22.accept_item(id);
    Get.snackbar(
      "تم",
      "تم قبول الطلب",
    );
    print(response);


  }

  onInit() {
    id=Get.arguments['id'];
    get_order();
    super.onInit();
  }


}