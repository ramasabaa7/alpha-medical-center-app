import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/patient/convert_request/convert_request_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Convert_request_controller extends GetxController {
  String selected="إختر الخدمة";
  late var type;
  List data_service = [];
  List data_service_to_show = [];
  late int id_visie;
   late int id_service;
  Rx<List<String>> selectedoptionlist_centerservices = Rx<List<String>>([]);
  var selectedoption_centerservices = "".obs;

  Convert_request_services services =
      Convert_request_services(Get.find(), Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  String? Function(String?)? valid;
  changedepartment(String value) {
    selected = value;
    update();
  }

  organization() async {
    await get_all_center_service();
    adding_data_to_data_service_to_show();
  }

  adding_data_to_data_service_to_show() {
    print("***** adding_data_to_data_service_to_show is working now *****");
    data_service.forEach((name) {
      print(name['ServiceName']);
      data_service_to_show.add(name['ServiceName']);
      print("data service to show are ${data_service_to_show}");
    });
  }

// init_id_service() {
//     print("id service init is work now");
//     data_service.forEach((element) {
//     if(element['Name']==selectedoption_centerservices.toString()){
//       id_service=element['id'];
//     }
//   });
//   print("the final id_service is ${id_service}");
// }
  add_service_for_patient() async {
    print(
        "the service wich has been choosen is ${selectedoption_centerservices}");
    print("id service init is work noww");
    data_service.forEach((element) {
      if (element['ServiceName'] == type) {
          id_service=element['center_service_id'];
        print("****************${element['center_service_id']}***************************");
      }
    });
     print("the final id_service is ${id_service}");
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_service_for_patient(id_visie, id_service);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تمت الإضافة بنجاح", "تمت عملية إضافة الخدمة بنجاح",);




    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إضافة  الخدمة بنجاح",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة  الخدمة بنجاح "));
    }
    update();
  }

  get_all_center_service() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await services.get_all_center_service();
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_service.clear();
      data_service.addAll(response['data']);

      print("the all center services are ${data_service}");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد خدمات لعرضها",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }

  @override
  void onInit() {
    organization();
    id_visie = Get.arguments['id_visit'];
    print("id for visit is ${id_visie}");
    super.onInit();
  }
}
