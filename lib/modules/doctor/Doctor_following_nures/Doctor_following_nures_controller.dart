
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/PersonalInformation/PersonalinfrmationServices.dart';
import 'package:flutter/widgets.dart';
import 'package:project_after_update/modules/doctor/Doctor_following_nures/Doctor_following_nures_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';


import 'package:intl/intl.dart';



class Doctor_following_nures_controller extends GetxController {
  Doctor_following_nures_services services = Doctor_following_nures_services(Get.find(),Get.find(),Get.find(),Get.find());
  StatusRequest? statusRequest;
  StatusRequest? statusRequest2;
  StatusRequest? statusRequest3;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List data2=[];
  List data3=[];

String end = "";
String start = "";
String end2 = "";
String start2 = "";



  final selectedDateStart = DateTime.now().obs;
  final selectedDateEnd = DateTime.now().obs;

  final selectedTimeStart = TimeOfDay(hour: 12, minute:0).obs;
  final selectedTimeEnd = TimeOfDay(hour: 12, minute:0).obs;

  //GlobalKey<FormState> formstate= GlobalKey<FormState>();
  int idSelected = 0;

  void selectNurse(int id) {
    idSelected = id;
  }




  get_users_users_by_type() async {
    statusRequest = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest}");
    var response = await services.get_users_byid(6);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {

       data.clear();
      data.addAll(response['data']) ;
      print("done");
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

  // var selectedUserId = 0.obs;


  @override
  void onInit() {
  get_users_users_by_type();
   get_all_nurese_follower();


    super.onInit();
  }

  Add_follow_nurse(BuildContext context)async{
    end   ="${DateFormat('yyyy/MM/dd').format(selectedDateEnd.  value  )}/${selectedTimeEnd.value.hour.toString().padLeft(2, '0')}:${selectedTimeEnd.value.minute.toString().padLeft(2, '0')} ${selectedTimeEnd.value.period == DayPeriod.am ? 'am' : 'pm'}}";
    start  ="${DateFormat('yyyy/MM/dd').format(selectedDateStart.  value  )}/${selectedTimeStart.value.hour.toString().padLeft(2, '0')}:${selectedTimeStart.value.minute.toString().padLeft(2, '0')} ${selectedTimeStart.value.period == DayPeriod.am ? 'am' : 'pm'}}";
    //  start ="${DateFormat('yyyy/MM/dd').format(selectedDateStart.value  )}/${selectedTimeStart.value.  format(context)}";
    end2=end.substring(0,16);
    start2=start.substring(0,16);

    statusRequest=StatusRequest.loading;
    update();
    var response =await services.AddFollower(3, idSelected, start2,end2);

    statusRequest=handlingdata(response);

    if(StatusRequest.succes==statusRequest){

      await Get.snackbar("تم التسجيل بنجاح", "تمت عملية تسجيل الزيارة بنجاح",);
      print('done');


    }else if(StatusRequest.failure==statusRequest){
      await Get.snackbar("تنبيه", "لم يتم تسجيل  الزيارة بنجاح",);
    }
    else{
      Get.defaultDialog(title: "حدث خطأ ما",content:Text("لم يتم تسجيل  الزيارة بنجاح "));
    }
    update();


  }
  //
  get_all_nurese_follower() async {
    statusRequest2 = StatusRequest.loading;
    update();
    print("statuserequest now is ${statusRequest2}");
    var response = await services.get_nurses_follower();

    statusRequest2 = handlingdata(response);

    if (StatusRequest.succes == statusRequest2) {

      data2.clear();
      data2.addAll(response['data']) ;
      print("done222");
      print(data2.isNotEmpty);
      print("done222");
      fetchNurseAndDoctorNames();
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
  Future<String> get_UserInfoByID(int id) async {
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


  final RxList<String> nurseNames = RxList<String>();
  final RxList<String> doctorNames = RxList<String>();
  fetchNurseAndDoctorNames() async {
    for (final nurse in data2) {
      String nameNurse = await get_UserInfoByID(nurse['ID_UserFollow']);
      print('lolololol');
      nurseNames.add(nameNurse);
    }

    for (final nurse in data2) {

      String nameDoctor = await get_UserInfoByID(nurse['ID_User']);
      print("weweweweweeewew");
      doctorNames.add(nameDoctor);
    }
  }


}
