import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../home_store/products_store.dart';
import 'Deletservic.dart';
import 'Trash_service.dart';
class Trash_controller extends GetxController{
  StatusRequest? statusRequest ;
  StatusRequest? statusRequest3 ;
  var data_details =[];
  var data_details3 =[];
  TRashService service = TRashService(Get.find());
  deletematirial service2v= deletematirial(Get.find());
  var products = [

    Product_store(name: 'كحول',quantity: 000,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 20),
    Product_store(name: 'علبة',quantity: 20,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 50),
    Product_store(name: 'كحول',quantity: 000,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 20),
    Product_store(name: 'علبة',quantity: 20,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 50),
    Product_store(name: 'كحول',quantity: 000,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 20),
    Product_store(name: 'علبة',quantity: 20,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 50),


  ].obs;



  // void updateQuantity(int index, String value) {
  //   products[index].quantity = int.parse(value);
  // }
  void errors(int quantity,int index) {
    print("ddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
    print(quantity);
    print(products[index].quantity);
    if (quantity > products[index].quantity) {
      Get.snackbar(
        'خطأ !!',
        'الكمية المدخلة أكبر من الكمية المتوافرة',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }

  var selectedValue = 'Option 1'.obs;
  var dropdownValues = ['Option 1', 'Option 2', 'Option 3'].obs;
  Trash() async {
    statusRequest = StatusRequest.loading;
    update();
    statusRequest =handlingdata(statusRequest);
    var response = await service.get_allMatirial();
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']) ;
      if(data_details.length==0){
        Get.snackbar(
          "تحذير",
          "لا يوجد بيانات لعرضها",
        );

      }

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
  deletematirial4(int id) async {

    var response = await service2v.deletemariralabyid(id);
       print(response);


  }
  onInit() {
    Trash();


    super.onInit();
  }

}