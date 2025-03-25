import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/add_service_type_for_reception/add_serive_type_rec_services.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/add_x_ray/add_x_ray_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Add_service_type_rec_controller extends GetxController{


  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  Add_service_type_rec_services services =Add_service_type_rec_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  late int id_section;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_type();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_type() async{

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_type(id_section, name);

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