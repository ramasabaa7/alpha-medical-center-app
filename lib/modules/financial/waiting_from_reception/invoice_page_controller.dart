import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/invoice_page_services.dart';
import 'package:project_after_update/modules/reception/patient/patient_services/patient_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class Invoice_page_controller extends GetxController {
  Invoice_page_services services =
      Invoice_page_services(Get.find(), Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late String name;

  late int id_visits;
  late int insurance_comp_id;
  String selected="إختر شركة التأمين";
  List test_data=[];
  List data=[];
  List data_company_to_show = [];
  late String discount_type;
  late String discount_details;
  late var type;
  changedepartment(String value) {
    selected = value;
    update();
  }
  List data_details = [];

  organization() async {
    await get_all_insurance_company();
    adding_data_to_data_company_to_show();
  }
  adding_data_to_data_company_to_show() {
    print("***** adding_data_to_data_service_to_show is working now *****");
    data.forEach((name) {
      data_company_to_show.add(name['Name']);
      print("data service to show are ${data_company_to_show}");
    });
  }
  get_patient_service() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_required_service(id_visits);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']);
      // Get.toNamed("/patient_details");
    }
    // else if(test_data.isEmpty) {
    //   await Get.snackbar(
    //     "تحذير",
    //     "لا يوجد بيانات لعرضها",
    //   );
    //
    // }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد خدمات لعرضها",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  add_bill() async {

    data.forEach((element) {
      if (element['Name'] == type) {
        insurance_comp_id=element['id'];
      }
    });
    print("hhhhhhheeeeellllllo the insurance_id is ${insurance_comp_id}   and id_visite is ${id_visits}" );
    statusRequest=StatusRequest.loading;
    update();
    var response =await services.add_bill(id_visits,insurance_comp_id,discount_type,discount_details);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تمت الإضافة بنجاح", "تمت عملية إضافة الفاتورة بنجاح",);
      Get.offNamed("/Add_receipts",arguments: {
        "id_bill" : response['data']['Bill']['id']
      });




    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم إضافة  الفاتورة بنجاح",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم إضافة  الفاتورة بنجاح "));
    }
    update();
  }
  get_all_insurance_company() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_insurance_company();
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد شركات تأمين لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد شركات تأمين لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_service_for_patienr(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_service_for_patient(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية الحذف",
      );
    } else {
      Get.defaultDialog(title: " تم", content: Text("تمت عملية الحذف بنجاح"));
    }
    update();
  }
  @override
  void onInit() {
    name = Get.arguments['name'];
    id_visits=Get.arguments['id_visits'];
    get_patient_service();
    organization();
    super.onInit();
  }
}
