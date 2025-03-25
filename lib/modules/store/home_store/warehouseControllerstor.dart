import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/products_store.dart';
import 'package:project_after_update/modules/store/home_store/updatedetalsservice.dart';
import 'package:project_after_update/modules/store/home_store/warehouseProdactstoreService.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/function/handlingdata.dart';
import '../../../static_colors/StaticColors.dart';
import '../../Lab/Warehose/products.dart';
import 'archiveservice.dart';



class warehouseControllerstor extends GetxController{
  int index = 0;
  StatusRequest? statusRequest ;
  StatusRequest? statusRequest2 ;
  StatusRequest? statusRequest3 ;
  StatusRequest? statusRequest8;
  StatusRequest? statusRequest7;
  Secury_storage secury_storage = new Secury_storage();
  var data_details =[];
  var data_details3 =[];
  warehouseProdactstorService service = warehouseProdactstorService(Get.find(),Get.find(),Get.find());
  Updateservic servic2 = Updateservic(Get.find());
  archiveServic servic3= archiveServic(Get.find());
  String name= '';
   String status= '';
   String quantity = '';
   String lower= '';
   String upper= '';
   String production= '';
   String Expiry= '';
  late int id ;



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
  updateMatirial() async {
    id = data_details[index]['id'];
    print('eeeeeeeeeeeeeeee');
    print(data_details[index]['Name']);
    if(name==''){name= data_details[index]['Name'];}
    if(quantity ==''){quantity= data_details[index]['Quantity'].toString();}
    if(lower ==''){lower= data_details[index]['Lower_Limit'].toString();}
    if(production ==''){production= data_details[index]['ProductionDate'].toString();}
    if(Expiry ==''){Expiry= data_details[index]['ExpiryDate'].toString();}
    statusRequest2 = StatusRequest.loading;
    update();
    statusRequest2 =handlingdata(statusRequest2);
    var response = await servic2.updateMatirial(id, name, '1', quantity, lower, '300', production, Expiry);
    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {
      Get.snackbar(

        'تم تعديل المادة',
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
  Archive() async {
    statusRequest3 = StatusRequest.loading;
    update();
    statusRequest3 =handlingdata(statusRequest3);
    var response = await servic3.Archivc();
    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {
      data_details3.clear();
      data_details3.addAll(response['data']) ;
      print( data_details3);

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
    update();
  }

  @override
  onInit() {
    getMatirial();


    super.onInit();
  }


  logout() async {
    statusRequest8 = StatusRequest.loading;
    update();
    var response = await service.logout();
    // test_data.addAll(response['data']) ;
    statusRequest8 = handlingdata(response);

    if (StatusRequest.succes == statusRequest8) {
      await Get.snackbar(
        "تم",
        "تم تسجيل الخروج بنجاح",
      );
      FirebaseMessaging.instance.unsubscribeFromTopic("reception");
      secury_storage.delete();

      Get.offAllNamed("/login");

    }
    else if (StatusRequest.failure == statusRequest8) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية تسجيل الخروج   ",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  String detaile ="";
  increment_requrst_Salary() async {
    statusRequest7 = StatusRequest.loading;
    update();
    var response = await service.increment_requrst_Salary(detaile);
    statusRequest7 = handlingdata(response);

    if (StatusRequest.succes == statusRequest7) {
      await Get.snackbar(
        "ملاحظة ",
        "تم إرسال الطلب بنجاج",
      );
    } else if (StatusRequest.failure == statusRequest7) {
      await Get.snackbar(
        "تنبيه",
        "فشل إرسال الطلب",
      );
    } else {
      Get.defaultDialog(title: " خطأ ", content: Text("حدث خطأ ما"));
    }
    update();
  }


}