

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/add_record/previous_medical_condition/add_pervious_medical_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Add_previous_medical_controller extends GetxController{




  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String diseasename;
  late String details;
  late int id_patient_record;
  Add_pervious_medical_services services =Add_pervious_medical_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_previus_medical();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_previus_medical() async{
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_previous_medical(diseasename,details,id_patient_record);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم التسجيل بنجاح", "تمت عملية تسجيل السوابق المرضية بنجاح",);


    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تحذير", "لا يمكن تسجيل السوابق ",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تسجيل  السوابق المرضية "));
    }
    update();
  }
  @override
  void onInit() {
    id_patient_record=Get.arguments['id'];
  }
}