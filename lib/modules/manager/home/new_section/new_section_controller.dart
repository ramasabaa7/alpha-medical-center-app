import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/new_section/new_section_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
class New_section_controller extends GetxController{

  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  New_section_services services =New_section_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_section();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_section() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_new_section(name);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية إضافة القسم بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إضافة القسم",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة القسم"));

    }
    update();

  }

}