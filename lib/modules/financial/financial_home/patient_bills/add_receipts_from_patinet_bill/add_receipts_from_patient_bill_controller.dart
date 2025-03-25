import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/financial_home/patient_bills/add_receipts_from_patinet_bill/add_receipts_from_patient_bill_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/visit_ergisteration/visit_register_in_reception_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_receipts_from_patient_bill_controller extends GetxController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late int id_bill;
  late var price;
  late var details;

  Add_receipts_for_patient_bill_services services =Add_receipts_for_patient_bill_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_receipts();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_receipts() async{
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_receipts(id_bill,price,details);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم التسجيل بنجاح", "تمت عملية تسجيل الوصل بنجاح",);



    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إنشاء الوصل",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إنشاء الوصل"));
    }
    update();
  }
  @override
  void onInit() {
    id_bill=Get.arguments['Bill_ID'];
  }
}