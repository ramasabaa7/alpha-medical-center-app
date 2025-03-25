import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/edit_clinics_services/edit_clinics_service_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/edit_laboratory_service/edit_laboratory_service_services.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/xray_center_services/edit_xray_service/edit_xray_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Edit_xray_services_controller extends GetxController{
  String selected="يوجد";
  List<String> department=[
    "يوجد",
    "لايوجد"
  ];
  changedepartment(String value){
    selected=value;
    update();
  }
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late String name;
  late String details;
  late String status;
  late String price;
  Edit_xray_service_services services =Edit_xray_service_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  late int id_type;
  late int id;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      edit_service();
    }else{
      print("الحقول غير صالحة");
    }
  }

  edit_service() async{
    if(selected=="يوجد"){
      status="1";
    }else{
      status="0";
    }
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.edit_xray_service(id,id_type, name, details, status, price);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم التعديل بنجاح", "تمت عملية تعديل الخدمة بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تعديل الخدمة",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تعديل الخدمة"));

    }
    update();

  }
  @override
  void onInit() {
    id=Get.arguments['id'];
    id_type=Get.arguments['id_type'];
    print("id type from add new service is ${id_type}");
    super.onInit();
  }
}