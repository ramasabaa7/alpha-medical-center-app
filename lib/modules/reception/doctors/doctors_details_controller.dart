import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/reception/doctors/doctoe_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Doctor_details_controller extends GetxController{
   int? id_doctor;
   int? id_doctor_to_show_res;

   Doctor_details_services services = Doctor_details_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();

  Map<String,dynamic> test_data_doctor={};
  Map<String,dynamic> data_doctor={};



  get_doctor_details() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_doctor_details(id_doctor!);
    test_data_doctor.addAll(response) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_doctor.isNotEmpty) {
      data_doctor.clear();
      data_doctor.addAll(response) ;
      print("response from patient controller");
      print(data_doctor);
      print("the name is ${data_doctor['name']}");

    }
    else if(test_data_doctor.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد تفاصيل لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد تفاصيل لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  goto_add_reservation(){
    Get.toNamed("/Add_reservation",arguments: {
      "id_doctor" : id_doctor.toString()
    });
  }
   goto_show_reservation(){
     Get.toNamed("/Reservations",arguments: {
       "id_doctor_to_show_res" : id_doctor_to_show_res.toString()
     });
   }
  @override
  void onInit() {
    id_doctor= Get.arguments["id_doctor"];
    id_doctor_to_show_res=Get.arguments["id_doctor"];
    get_doctor_details();
    print("from doctor details the id doctor is  ${id_doctor}");
  }
}

