import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/add_clinics_services/add_clinics_service_services.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/add_laboratory_services/add_laboratory_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Add_laboratory_services_controller extends GetxController{
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
  Add_laboratory_service_services services =Add_laboratory_service_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var message;
  late int id_type;
  String? Function(String?)? valid;

  checkinput(){
    var formdata=formstate.currentState;
    if(formdata!.validate()){
      add_service();
    }else{
      print("الحقول غير صالحة");
    }
  }

  add_service() async{
    if(selected=="يوجد"){
      status="1";
    }else{
      status="0";
    }
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_laboratory_service(id_type, name, details, status, price);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم الإضافة بنجاح", "تمت عملية إضافة الخدمة بنجاح",);

    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إضافة الخدمة",);

    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة الخدمة"));

    }
    update();

  }
  @override
  void onInit() {
    id_type=Get.arguments['id_type'];
    print("id type from add new service is ${id_type}");
    super.onInit();
  }
}