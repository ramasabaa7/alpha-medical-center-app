import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/Nurse/EditVisitNurse/EditVisitNurseServices.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

class EditVisitNurseController extends GetxController{

  final TextEditingController  textEditingController = TextEditingController();

  // @override
  // void onInit() {
  //   textEditingController.text="jik kkuhun kuiuyu hiyuybyut7ithiuyiuy yui kjhkh  jjj uuu  jjj  jjj hhhkk" ;
  //   super.onInit();
  //
  //
  // }
  void showMyDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('حذف المعاينة'),
        content: Text('هل تريد حذف هذه المعاينة'),
        actions: [

          TextButton(
            child: Text('تجاهل',style: TextStyle(color: Colors.black38)),
            onPressed: () {
              Get.back();

            },
          ),
          TextButton(
            child: Text('تأكيد',style: TextStyle(color: Colors.red)),
            onPressed: () {
              this.deleteVisit();
              Get.offNamed('/patientVisitRecord');
            },
          ),

        ],
      ),
    );
  }
  void deleteVisit() {

    Get.snackbar(
      ' ',
      'تم حذف المعاينة من سجل المريض بنجاح',
      backgroundColor: Colors.white10,
      colorText: Colors.indigo,

    );
  }
  void EditVisi() {
    Get.snackbar(
      '   تم  ',
      '',
      titleText: Text("     تم ", style: TextStyle(
          fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
      messageText: Text("     تم  تعديل بيانات المعاينة بنجاح",
        style: TextStyle(fontSize: 18, color: Colors.indigo),),
      backgroundColor: Colors.white,
      colorText: Colors.indigo,
      icon: Icon(
          Icons.check_circle_outline_outlined, color: Colors.indigo, size: 40),

    );
  }
  GlobalKey<FormState> formstate3 = GlobalKey<FormState>();
  late String title;
  late String referringphysician;
  late int id;
  late int idpatientrecord;
  EditVisitNurseServices services = EditVisitNurseServices(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  late var token;
  String? Function(String?)? valid;

  checkinput() {
    var formdata = formstate3.currentState;
    if (formdata!.validate()) {
      edit_visit();
    } else {
      print("الحقول غير صالحة");
    }
  }

  edit_visit() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.edit_visit(
        id, idpatientrecord, title, referringphysician);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar(
        "تم التعديل بنجاح",
        "تمت عملية تعديل الزيارة بنجاح",
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
    id = Get.arguments['id'];
    idpatientrecord=Get.arguments['idpatientrecord'];
    super.onInit();
  }




}