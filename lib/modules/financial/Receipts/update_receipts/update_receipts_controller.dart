import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/Receipts/update_receipts/update_receipts_services.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/Add_Receipts/add_receipts_services.dart';

import 'package:project_after_update/modules/reception/patient/patient_details/visit_ergisteration/visit_register_in_reception_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Update_receipts_controller extends GetxController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late int id_receipt;
  late int id_bill;
  late var price;
  late var details;
  Update_receipts_services services = new Update_receipts_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = Secury_storage();
  late var message;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      update_receipts();
    }else{
      print("الحقول غير صالحة");
    }
  }

  update_receipts() async{
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.update_receipt(id_receipt,price,details,id_bill);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم التعديل بنجاح", "تمت عملية تعديل الوصل بنجاح",);



    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تعديل الوصل ");
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إنشاء الوصل"));
    }
    update();
  }
  @override
  void onInit() {
    id_receipt=Get.arguments['id'];
    id_bill=Get.arguments['id_bill'];
  }
}