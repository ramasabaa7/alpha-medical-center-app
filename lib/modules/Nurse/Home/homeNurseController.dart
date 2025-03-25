import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_after_update/modules/Nurse/Home/homeNurseServices.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'dart:collection';

class homeNurseController extends GetxController {
  var notificationCount = 0.obs;
  var isStoping = false.obs;
  RxBool isFilterOn =true.obs ;
  void toggleStop() {
    isStoping.value = !isStoping.value;
  }

  void incrementNotificationCount() {
    notificationCount.value++;
  }

  homeNurseServices services =
  homeNurseServices(Get.find(), Get.find(), Get.find(), Get.find(),Get.find(),Get.find(),Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  StatusRequest? statusRequest2;
  StatusRequest? statusRequest3;
  StatusRequest? statusRequest4;
  StatusRequest? statusRequest5;
  StatusRequest? statusRequest6;
  StatusRequest? statusRequest7;
  StatusRequest? statusRequest8;
  StatusRequest? statusRequest9;

  Secury_storage secury_storage = new Secury_storage();
  late String id_patient;

  List data_details = [];
  List data2 = [];
  List data3 = [];
  List data4 = [];
  List data5 = [];
  List data9 = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<Map<String, dynamic>> listOfFollowerData = [];
  List<Map<String, dynamic>> data_work = [];

  @override
  void onInit() {

    get_my_user();
    super.onInit();
  }

  checkinput() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      get_patient_details();
    } else {
      print("الحقول غير صالحة");
    }
  }

  get_patient_details() async {
    statusRequest = StatusRequest.loading;
    update();
    print("wwaaaarning ${id_patient}");
    var response = await services.get_patient_details(id_patient);
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      data_details.clear();
      data_details.addAll(response['data']);
      Get.toNamed("/AddVisit", arguments: {
        "id": data_details[0]['id'],
        "IDPersonal": data_details[0]['IDPersonal']
      });
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }

  get_all_nurese_follower() async {
    statusRequest2 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest2}");
    var response = await services.get_nurses_follower();

    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {
      data2.clear();
      data2.addAll(response['data']);
      print("done222");
      print(data2.isNotEmpty);
      print("done222");
      listOfFollowerData = getListOfFollowerData();
      data_work = getFilteredFollowerData();
      get_name_sernice();
      // get_name_doctor();
      print(data_work);
    } else if (StatusRequest.failure == statusRequest2) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  List<String> data_names_doctor = [];
  Future<void> get_name_doctor() async {
    for (var item in data2) {
      if (item['ID_UserFollow'] == data9[0]['id']) {
        String id = await get_doctor_name(item['ID_User']);
        print("${id}");
        data_names_doctor.add(id);
      }

      // String name_service = await get_name_of_service(type_service_id);

    }
    print('namessssssss33333');
    print(data_names_doctor);
  }



  List<Map<String, dynamic>> getListOfFollowerData() {
    List<Map<String, dynamic>> data = [];
    for (var item in data2) {
      if (item['ID_UserFollow'] == data9[0]['id']) {
        print(item);
        print('5');
        data.add(item);

      }
    }
    return data;
  }

  List<Map<String, dynamic>> getFilteredFollowerData() {
    List<Map<String, dynamic>> data_work = [];
    for (var item in listOfFollowerData) {
      String startTime = item['StartTime'];
      int day_s = int.parse(startTime.substring(8, 10));
      int month_s = int.parse(startTime.substring(5, 7));
      int year_s = int.parse(startTime.substring(0, 4));

      String endTime = item['EndTime'];
      int day_e = int.parse(endTime.substring(8, 10));
      int month_e = int.parse(endTime.substring(5, 7));
      int year_e = int.parse(endTime.substring(0, 4));

      DateTime now = DateTime.now();

      if (now.year >= year_s &&
          now.month >= month_s &&
          now.day >= day_s &&
          now.year <= year_e &&
          now.month <= month_e &&
          now.day <= day_e) {
        print("yessss");
        data_work.add(item);
      }
    }

    return data_work;
  }
  List<String> data_names = [];
  List<int> data_num = [];

  Future<void> get_name_sernice() async {
    for (var item in data_work) {
      int type_service_id = await get_UserInfoByID(item['ID_User']);
data_num.add(type_service_id);
      print("${type_service_id}");
     //  name_service = await get_name_of_service(type_service_id);
      data_names.add(await get_name_of_service(type_service_id));
    }
    print('namessssssss');
    print(data_names);
  }




  Future<int> get_UserInfoByID(int id) async {
    print("${id}");
    print("hhhhhhhhhhhhhhhhhh");
    statusRequest3 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest3}");
    var response = await services.get_UserInfoByID(id);

    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {
      data3.clear();
      data3.add(response);
      print("done3333333");
      // Return the "name" field from the response
      return response["id_TypeCenterServices"];
    } else if (StatusRequest.failure == statusRequest3) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطأ ما"));
    }
    update();

    // Return an empty string if there was an error
    return 0;
  }

  Future<String> get_doctor_name(int id) async {
    print("${id}");
    print("hhhhhhhhhhhhhhhhhh");
    statusRequest3 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest3}");
    var response = await services.get_UserInfoByID(id);

    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {
      data3.clear();
      data3.add(response);
      print("done3333333");
      // Return the "name" field from the response
      return response["name"];
    } else if (StatusRequest.failure == statusRequest3) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطأ ما"));
    }
    update();

    // Return an empty string if there was an error
    return "";
  }


  get_allwaitingPatient(int id) async {
    statusRequest4 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest4}");
    var response = await services.get_allwaitingPatient(id);

    statusRequest4 = handlingdata(response);

    if (StatusRequest.succes == statusRequest4) {
      data4.clear();
      data4.addAll(response['data']);
      print(response);
      print("doneWait");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }
  Future<String> get_name_of_service(int id) async {
    print("${id}");
    print("hhhhhhhhhhhhhhhhhh");
    statusRequest5 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest5}");
    var response = await services.get_name_of_service(id);

    statusRequest5 = handlingdata(response);

    if (StatusRequest.succes == statusRequest5) {
      data5.clear();
      data5.addAll(response["data"]);
      print("done3333333");

      print(data5);
      String name = data5[0]['Name'];
      return name;
      return "";
    } else if (StatusRequest.failure == statusRequest5) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطأ ما"));
    }
    update();

    // Return an empty string if there was an error
    return "";
  }


  changstatuslabbyidservic(int status , int type) async {
    statusRequest3 = StatusRequest.loading;
    update();

    var response = await services.changstatuslabbyidservice(type);
    statusRequest3 = handlingdata(response);

    if (StatusRequest.succes == statusRequest3) {
      if(status==0){
        Get.defaultDialog(title: "", content: Text("تم إيقاف طلبات التحويل"));}
      else {
        Get.defaultDialog(title: "", content: Text("تم استئناف طلبات التحويل"));

      }


    }

    else if (StatusRequest.failure == statusRequest3) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد بيانات لعرضها",
      );
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();

  }
  String detaile ="";
  increment_requrst_Salary() async {
    statusRequest7 = StatusRequest.loading;
    update();
    var response = await services.increment_requrst_Salary(detaile);
    statusRequest7 = handlingdata(response);

    if (StatusRequest.succes == statusRequest7) {
      await Get.snackbar(
        "ملاحظة ",
        "تم إرسال الطلب بنجاج",
      );
    } else if (StatusRequest.failure == statusRequest7) {
      await Get.snackbar(
        "تنبيه",
        "فشل إرسال الطلب",
      );
    } else {
      Get.defaultDialog(title: " خطأ ", content: Text("حدث خطأ ما"));
    }
    update();
  }

  get_my_user() async {
    statusRequest9 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest9}");
    var response = await services.get_my_user_info();

    statusRequest9 = handlingdata(response);

    if (StatusRequest.succes == statusRequest9) {

      data9.clear();
      data9.add(response['data']) ;
      print(response);
      print("get information");
      get_all_nurese_follower();

    } else if (StatusRequest.failure == statusRequest9) {
      await Get.snackbar(
        "تحذير",
        "",
      );
    } else {
      Get.defaultDialog(title: "حدث خطأ ما", content: Text("حدث خطا ما"));
    }
    update();
  }


  logout() async {
    statusRequest8 = StatusRequest.loading;
    update();
    var response = await services.logout();
    // test_data.addAll(response['data']) ;
    statusRequest8 = handlingdata(response);

    if (StatusRequest.succes == statusRequest8) {
      await Get.snackbar(
        "تم",
        "تم تسجيل الخروج بنجاح",
      );
      FirebaseMessaging.instance.unsubscribeFromTopic("reception");
      secury_storage.delete();

      Get.offAllNamed("/login");

    }
    else if (StatusRequest.failure == statusRequest8) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية تسجيل الخروج   ",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
}
