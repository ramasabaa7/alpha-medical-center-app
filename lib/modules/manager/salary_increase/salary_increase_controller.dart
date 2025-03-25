

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/salary_increase/salary_increase_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Salary_increase_controller extends GetxController {
  Salary_increase_services services = Salary_increase_services(Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List data_salary=[];
  List test_data=[];
  List test_data_salary=[];
  late String new_salary;

  bool droped = false;

  ontapdropdown(bool droped) {
    this.droped = !droped;
    update();
  }
  get_all_salary_increase() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_salary_increase_requist();
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("response from patient controller");
      print(data);
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
  accept_salary_increase(int id,int user_id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await services.accept_salary_increase_request(id,user_id,new_salary);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم قبول الطلب",
        "تم قبول طلب الزيادة بنجاح",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      Get.defaultDialog(
          title: "حدث خطأ ما", content: Text("لم يتم قبول طلب الزيادة "));
    }
    update();
  }
  reject_salary_increase(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.reject_salary_increase_request(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("!", "تمت عملية رفض الزيادة بنجاح ");

    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "${response['message']}",
      );
    } else {
      await Get.snackbar("تنبيه", "تمت عملية رفض الزيادة بنجاح");
      //  Get.defaultDialog(title: " تم", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_salary(int user_id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_salary(user_id);
    print("baaaaaaaaaaa");
    print(response['data']['user'].values);

    test_data_salary.addAll(response['data']['user'].values) ;
    print("the salary is ${test_data_salary[2]}");
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_salary.isNotEmpty) {
      data_salary.clear();
      data_salary.addAll(response['data']['user'].values) ;
      print("response from patient controller");
      print(data_salary);
    }
    else if(test_data_salary.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد راتب لعرضه",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد راتب لعرضه",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
@override
  void onInit() {
    get_all_salary_increase();

    super.onInit();
  }
}
