import 'package:get/get.dart';
import 'package:flutter/material.dart';
class EditVisitX_RayController extends GetxController{

  final TextEditingController  textEditingController = TextEditingController();

  @override
  void onInit() {
    textEditingController.text="we love you" ;
    super.onInit();


  }
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


}