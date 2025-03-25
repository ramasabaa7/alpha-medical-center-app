import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/config/user_information.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/login/login_services.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/wating_in_clinics/wating_in_clinics_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_visits/patient_visits_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class wating_in_clincis_controller extends GetxController {
  wating_in_clinics_services services = wating_in_clinics_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data = [];
  List test_data = [];
  List data_service = [];
  List test_data_service = [];
  List test_data_waating_req = [];
  List data_wating_req = [];
  late int id;
  late int status;
  get_wating_request() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_wating_request(id);
    test_data_waating_req.addAll(response['data']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest &&
        test_data_waating_req.isNotEmpty) {
      data_wating_req.clear();
      data_wating_req.addAll(response['data']);
      print("response from patient controller");
      print(data_wating_req);
    } else if (test_data_waating_req.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد طلبات استقبال لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد طلبات استقبال لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  get_all_doctors() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_doctors(id);
    test_data.addAll(response['data'][0]['user']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest && test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data'][0]['user']);
      print("response from patient controller");
      print(data);
      print(data[0]['username']);
    } else if (test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد أطباء لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد أطباء لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  get_all_services_intype() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_services_in_type(id);
    test_data_service.addAll(response['data'][0]['center_service']);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest && test_data_service.isNotEmpty) {
      data_service.clear();
      data_service.addAll(response['data'][0]['center_service']);
      print("response from get all section controller");
      print(data_service);
    } else if (test_data_service.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد خدمات لعرضهم",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد خدمات لعرضهم",
      );
    } else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  @override
  void onInit() {
    id = Get.arguments['id'];
    status=Get.arguments['status'];
    print("from wating controller the id of section is ${id}");
    get_wating_request();
    get_all_doctors();
    get_all_services_intype();
  }
}
