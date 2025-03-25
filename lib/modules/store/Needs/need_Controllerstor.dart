import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../x-Ray/warehose/Addorderservic.dart';
import '../../x-Ray/warehose/additemsServic.dart';
import '../home_store/products_store.dart';
import 'need_servic.dart';







class need_controller extends GetxController{
  StatusRequest? statusRequest ;
  var data_details =[];

  StatusRequest? statusRequest2 ;
  StatusRequest? statusRequest3 ;
  late var id_order ;
  late var id_matirial;
  late var name;
  late var quantity;



  addorderserver service2 = addorderserver(Get.find());
  addItemservic service3 =addItemservic(Get.find());

  var data_details2=[];


  NeedService service = NeedService(Get.find());

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
  void order(int quantity,int index) {
    print("ddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
    print(quantity);
    print(products[index].quantity);
  }

  var selectedValue = 'Option 1'.obs;
  var dropdownValues = ['Option 1', 'Option 2', 'Option 3'].obs;
  Need() async {
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
    Need();


    super.onInit();
  }

}