


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Join_request_controller extends GetxController {
  String selected="طبيب";
  String selected2="اختر خدمة";
  String selected3="اختر الدور الوظيفي";
  List<String> department=[
    "طبيب",
    "ممرض",
    " أشعة",
    "مخبر",
    "مالية",
    "مدير",
    "إسعاف",
    "إستقبال",
    "أدمن",
    "مخزن",
    "ضيف"
  ];
  changedepartment(String value){
    selected=value;
    update();
  }
  changedepartment_two(String value){
    selected2=value;
    update();
  }
  changedepartment_thre(String value){
    selected3=value;
    update();
  }
  late var type;
  late var type2;
  late var type3;

  late int id_type_user;
  Join_request_services services = Join_request_services(Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();


  List data=[];
  List data_type_user=[];

  List test_data=[];
  List test_data_type_user=[];

  List test_data_type_services=[];
  List data_type_services=[];

  List test_data_roles=[];
  List data_roles=[];

  bool reload=false;

  List data_service_to_show = [];
  List data_roles_to_show = [];

  late int id_type_services;
  late int id_roles;

 Future<void> hotreload()async {
   await !(reload);
    update();
  }


  organization() async {
    await get_all_type_services_in_center();
    adding_data_to_data_service_to_show();
    adding_data_to_data_roles_to_show();
  }

  adding_data_to_data_service_to_show() {
    print("***** adding_data_to_data_service_to_show is working now *****");
    data_type_services.forEach((name) {
      print(name['Name']);
      data_service_to_show.add(name['Name']);
      print("data service to show are ${data_service_to_show}");
    });
  }
  adding_data_to_data_roles_to_show() {
    print("***** adding_data_to_data_service_to_show is working now *****");
    data_roles.forEach((role) {
      print(role['name']);
      data_roles_to_show.add(role['name']);
      print("data roles to show are ${data_roles_to_show}");
    });
  }


  get_all_type_user() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_type_user();
    test_data_type_user.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_type_user.isNotEmpty) {
      data_type_user.clear();
      data_type_user.addAll(response['data']) ;
      print("all type users is");
      print(data_type_user);
    }
    else if(test_data_type_user.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد طلبات لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد طلبات لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_all_type_services_in_center() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_type_services_in_center();
    test_data_type_services.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_type_services.isNotEmpty) {
      data_type_services.clear();
      data_type_services.addAll(response['data']) ;
      print("all type section is");
      print(data_type_services);
    }
    else if(test_data_type_services.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد خدمات لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد خدمات لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  get_all_roles() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_roles();
    test_data_roles.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_roles.isNotEmpty) {
      data_roles.clear();
      data_roles.addAll(response['data']) ;
      print("all roles is");
      print(data_roles);
    }
    else if(test_data_roles.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد أدوار لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد أدوار لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_all_join_request() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_join_request();
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("response from patient controller");
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد طلبات لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد طلبات لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  accept_join(int id) async {
    if(type == "طبيب"){
      type="Doctor";
    } else if(type=="أدمن"){
      type="Administration";
    }else if(type=="إسعاف"){
      type="Ambulance";
    }
    else if(type=="مالية"){
      type="Finance";
    }
    else if(type=="مخبر"){
      type="Laboratory";
    }
    else if(type=="مدير"){
      type="Manager";
    }
    else if(type=="ممرض"){
      type="Nurse";
    }
    else if(type=="أشعة"){
      type="Radiographer";
    }
    else if(type=="إستقبال"){
      type="Receptionist";
    } else if(type=="ضيف"){
      type="Guest";
    }else{
      type="Store";
    };
    data_type_user.forEach((name) {
      if(name['Name']==type){
        id_type_user=name['id'];
      }
    });
    data_type_services.forEach((element) {
      if(element['Name']==type2){
        id_type_services=element['id'];
      }
    });
    data_roles.forEach((role) {
      if(role['name']==type3&&role['guard_name']=="sanctum"){
        id_roles=role['id'];
      }
    });
    statusRequest = StatusRequest.loading;
    print("thee id type user ya youssef is ${id_type_user}");
    update();
    var response =
    await services.accept_join(id,id_type_user,id_type_services,id_roles);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم قبول الطلب",
        "تم قبول طلب الإنضمام بنجاح",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      Get.defaultDialog(
          title: "حدث خطأ ما", content: Text("لم يتم قبول طلب الإنضمام "));
    }
    update();
  }
  reject_join(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.reject_join(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("!", "تمت عملية رفض طلب الإنضمام ");

    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      await Get.snackbar("تنبيه", "تمت عملية رفض الطلب بنجاح");
      //  Get.defaultDialog(title: " تم", content: Text("حدث خطا ما"));
    }
    update();
  }


  @override
  void onInit()async{
   await get_all_type_user();
   await get_all_roles();
   await organization();
    get_all_join_request();
  }
}
