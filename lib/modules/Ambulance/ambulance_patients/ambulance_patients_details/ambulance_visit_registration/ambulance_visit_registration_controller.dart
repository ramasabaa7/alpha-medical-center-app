

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_details/ambulance_visit_registration/ambulance_visit_registeration_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Ambulance_visit_registration_controller extends GetxController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String referingdoctor;
  late int IDPatientRecord ;
  late String title;
  Ambulance_visit_registration_services services =Ambulance_visit_registration_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      visit_registration();
    }else{
      print("الحقول غير صالحة");
    }
  }

  visit_registration() async{
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.visit_registration(IDPatientRecord, title, referingdoctor);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم التسجيل بنجاح", "تمت عملية تسجيل الزيارة بنجاح",);


    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تسجيل  الزيارة بنجاح",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تسجيل  الزيارة بنجاح "));
    }
    update();
  }
@override
  void onInit() {
    IDPatientRecord=Get.arguments['IDPatientRecord'];
    title=Get.arguments['title'];
  }
}