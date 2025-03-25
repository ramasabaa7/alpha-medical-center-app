import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/add_analysis/add_analysis_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Add_analysis_type_controller extends GetxController{

  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  Add_analysis_type_services services =Add_analysis_type_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  late int id_section;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_type_analysis();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_type_analysis() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_type_analysis(id_section, name);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية إضافة النوع بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إضافة النوع",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة النوع"));

    }
    update();

  }
  @override
  void onInit() {
    id_section=Get.arguments['id_section'];
    print("id section from add new type is ${id_section}");
    super.onInit();
  }
}