import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/Modules/lab/warehose/products.dart';
import 'package:project_after_update/modules/Lab/Warehose/pruductservice.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';

import 'Addorderservic.dart';
import 'additemsServic.dart';

class Nurse_warehouseController extends GetxController{
  StatusRequest? statusRequest ;
  StatusRequest? statusRequest2 ;
  StatusRequest? statusRequest3 ;
  late var id_order ;
  late var id_matirial;
  late var name;
  late var quantity;


  ProdactService service = ProdactService(Get.find());
  addorderserver service2 = addorderserver(Get.find());
  addItemservic service3 =addItemservic(Get.find());
  var data_details =[];
  var data_details2=[];




  // void updateQuantity(int index, String value) {
  //   products[index].quantity = int.parse(value);
  // }
  void errors(int quantity,int index) {
    if (quantity > data_details[index]['Quantity']) {
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
  getMatirial() async {
    statusRequest = StatusRequest.loading;
    update();
    statusRequest =handlingdata(statusRequest);
    var response = await service.get_allMatirial();
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
  addorder()async{
    print('dddddddddddd');
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await service2.addorder();
    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {

      data_details2.clear();
      data_details2.add(response['data']) ;

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("اسم المستخدم أو كلمة المرور خطا"));
    }


  }
  additem() async {
    if(quantity!=null){
      statusRequest3 = StatusRequest.loading;
      update();
      statusRequest3 =handlingdata(statusRequest);
      var response = await service3.addorder(id_order,id_matirial, name, quantity);
      statusRequest3 = handlingdata(response);

      if (StatusRequest.succes == statusRequest3) {
        print('wwwwwwwwwwwwwwwwwwwwwwwwwww');
        Get.snackbar(
          "تم",
          "تم اضافة المادة للطلب",
        );

      }

      else if (StatusRequest.failure == statusRequest3) {
        await Get.snackbar(
          "تحذير",
          "لا يوجد بيانات لعرضها",
        );
      }
      else{
        Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
      }
      update();}
    else{
      Get.snackbar(
        "تحذير",
        "يجب إدخال الكمية",
      );

    }
  }
  onInit() {
    getMatirial();


    super.onInit();
  }

}