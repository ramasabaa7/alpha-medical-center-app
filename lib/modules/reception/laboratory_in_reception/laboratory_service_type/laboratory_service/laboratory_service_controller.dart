import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/clinics_details_in_managment_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/laboratory_center_service_services.dart';
import 'package:project_after_update/modules/reception/laboratory_in_reception/laboratory_service_type/laboratory_service/laboratory_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class laboratory_service_controller extends GetxController {

  Laboratory_service_services services = Laboratory_service_services(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  late int id_type;
  late int status;
  List data_doctor=[];
  List test_data_doctor=[];
  List data_wating_req=[];
  List test_data_waating_req=[];

  List<String> options = [
    "الأحد",
    "الإثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
  ];
  List<String> options_houer = [
    "12-2",
    "2-4",
    "4-6",
    "6-8",
    "8-10",
  ];
  Rx<List<String>> selectedoptionlist = Rx<List<String>>([]);
  Rx<List<String>> selectedoptionlist_houer = Rx<List<String>>([]);
  var selectedoption = "".obs;
  var selectedoption_houer = "".obs;
  get_wating_request() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_wating_request(id_type);
    test_data_waating_req.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_waating_req.isNotEmpty) {
      data_wating_req.clear();
      data_wating_req.addAll(response['data']) ;
      print("response from patient controller");
      print(data_wating_req);
    }
    else if(test_data_waating_req.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد طلبات استقبال لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد طلبات استقبال لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  get_all_doctors() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_doctors(id_type);
    test_data_doctor.addAll(response['data'][0]['user']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_doctor.isNotEmpty) {
      data_doctor.clear();
      data_doctor.addAll(response['data'][0]['user']) ;
      print("response from patient controller");
      print(data_doctor);
      print(data_doctor[0]['username']);
    }
    else if(test_data_doctor.isEmpty) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد أطباء لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد أطباء لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  get_all_services_intype() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_services_in_type(id_type);
    test_data.addAll(response['data'][0]['center_service']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data'][0]['center_service']) ;
      print("response from get all section controller");
      print(data);
    }
    else if(test_data.isEmpty) {
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

  @override
  void onInit() {
    id_type=Get.arguments['id_type'];
    status=Get.arguments['Status'];
    get_wating_request();
    get_all_doctors();
    get_all_services_intype();

    super.onInit();
  }
}