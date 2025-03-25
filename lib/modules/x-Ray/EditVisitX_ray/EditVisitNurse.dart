import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'EditVisitNurseController.dart';
class EditVisitx_ray extends StatelessWidget {
  EditVisitX_RayController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'تفاصيل المعاينة',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            buildTextField("اسم الصورة"),
            buildTextField("تقرير الطبيب"),
            buildTextField("اسم الطبيب"),
            SizedBox(height: 40,),
            Center(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(onPressed: (){    controller.showMyDialog();
                  }, icon: Icon(Icons.delete_outline,color: Colors.red,size: 50,)),
                  SizedBox(width: 50,),
                  IconButton(onPressed: (){controller.EditVisi();}, icon:  Icon(Icons.check_circle_outline_outlined,color: Color(0xff9bb4fd),size:50 ,))
                ],
              ),
            ),

            SizedBox(height: 70,),


          ],



        ),
      ),


    );
  }
  Widget buildTextField(String string) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 30,left: 15,right: 15),
      // width: Get.width * 0.90,
      //  height: Get.height * 0.12,

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child:  TextField(


        controller: controller.textEditingController,
        textDirection: TextDirection.rtl,
        maxLines: null,
        textAlign: TextAlign.right,

        decoration: InputDecoration(

          labelText:'${string}' ,


          labelStyle: TextStyle(color: Color(0xff88a5fc),
              fontSize: 22.5,
              fontWeight: FontWeight.bold

          ),

          border: OutlineInputBorder(),

        ),
      ),


    );
  }
}