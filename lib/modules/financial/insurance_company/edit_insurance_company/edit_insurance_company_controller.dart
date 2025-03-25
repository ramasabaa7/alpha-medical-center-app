
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/insurance_company/edit_insurance_company/edit_insurance_company_services.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/edit_clinics_type_in_managment/edit_clinics_type_services.dart';
import 'package:project_after_update/modules/manager/home/edit_section/edit_section_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/edit_analysis_type_in_managnent/edit_analysis_type_services.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/edit_service_type_reception/edit_service_type_rec_services.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/edit_xray_type_in_managment/edit_xray_type_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

/////////////////
class Edit_insurance_company_controller extends GetxController {
  GlobalKey<FormState> formstate4 = GlobalKey<FormState>();
  late String name;
  late String IN;
  late String AMB;
  late String PM;
  late String DV;
  late int company_id;
  Edit_insurance_company_services services = Edit_insurance_company_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var token;
  String? Function(String?)? valid;

  checkinput() {
    var formdata = formstate4.currentState;
    if (formdata!.validate()) {
      edit_insurance_company();
    } else {
      print("الحقول غير صالحة");
    }
  }

  edit_insurance_company() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.edit_insurance_company(company_id,name,IN,AMB,PM,DV);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل معلومات شركة التأمين  بنجاح",
      );
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم يتم التعديل",
      );
    } else {
      Get.defaultDialog(title: " خطأ ", content: Text("حدث خطأ ما"));
    }
    update();
  }

  @override
  void onInit() {
    company_id=Get.arguments['company_id'];
    super.onInit();
  }
}