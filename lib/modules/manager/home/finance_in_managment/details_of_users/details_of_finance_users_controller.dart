import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/finance_in_managment/details_of_users/details_of_finance_users_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/details_of_users/details_of_users_services.dart';
import 'package:project_after_update/modules/reception/doctors/doctoe_details_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Details_of_finance_user_controller extends GetxController{
  int? id_user;


  Details_of_finance_users_services services = Details_of_finance_users_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();

  Map<String,dynamic> test_data_doctor={};
  Map<String,dynamic> data_doctor={};



  get_user_details() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_users_details(id_user!);
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

  @override
  void onInit() {
    id_user= Get.arguments["id_user"];
    get_user_details();
    print("from doctor details the id doctor is  ${id_user}");
  }
}

