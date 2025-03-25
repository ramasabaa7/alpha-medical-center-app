import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/clinics_details_in_managment_services.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/doctors_details_in_managment/doctors_detasils_in_mangment_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/doctors_details_in_laboratory/doctors_detasils_in_laboratory_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class Doctor_details_in_laboratory_controller extends GetxController {


  Doctor_details_in_laboratory_services services = Doctor_details_in_laboratory_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();

  Map<String,dynamic> test_data_doctor={};
  Map<String,dynamic> data_doctor={};
  late int id;



  get_doctor_details() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_doctor_details(id);
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
    id=Get.arguments['id'];
    get_doctor_details();

    super.onInit();
  }
}