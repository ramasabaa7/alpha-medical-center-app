import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/products_store.dart';
import 'package:project_after_update/modules/store/home_store/warehouseProdactstoreService.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../../static_colors/StaticColors.dart';
import '../../Lab/Warehose/products.dart';
import 'addmatirialServic.dart';



class addmatirialcontoller extends GetxController{
  int index = 0;
  StatusRequest? statusRequest ;
  late String name;
  late String status;
  late String quantity ;
  late String lower;
  late String upper;
  late String production;
  late String Expiry;

  Addmatirialservic service = Addmatirialservic(Get.find());



  // void updateQuantity(int index, String value) {
  //   products[index].quantity = int.parse(value);
  // }
  // void errors(int quantity,int index) {
  //   print("ddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
  //   print(quantity);
  //   print(products[index].quantity);
  //   if (quantity > products[index].quantity) {
  //     Get.snackbar(
  //       'خطأ !!',
  //       'الكمية المدخلة أكبر من الكمية المتوافرة',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  //
  // }

  AddMatirial() async {
    statusRequest = StatusRequest.loading;
    update();
    statusRequest =handlingdata(statusRequest);
    var response = await service.AddMatirial(name,'1', quantity, lower,'33', production, Expiry);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      Get.snackbar(

        'تم إضافة المادة',
        ''
        ,
        backgroundColor: Colors.white,
        colorText:StaticColor.primarycolor,
      );


    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }


}