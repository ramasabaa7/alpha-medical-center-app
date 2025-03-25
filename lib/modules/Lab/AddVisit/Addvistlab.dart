import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/homelabController.dart';
import 'Addvisitcontrollerlab.dart';



class Addvisitlab extends StatelessWidget {

  Addvisitcontrollerlab addvisitcontrollerlab =Get.find();
  File? file;
  bool isloading =false;
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
            '${addvisitcontrollerlab.name}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/VisitsListlab',arguments: {
                    "RequiredPatientID" : addvisitcontrollerlab.id_requrd,
                    "IDPatientRecord" : addvisitcontrollerlab.id_patient,
                    });
                  },
                  child: Container(
                    color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                    // margin: const EdgeInsets.only(bottom: 7,left: 7,right: 7),
                    width: Get.width,
                    height: 60,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.arrow_back_ios,
                              color: Color(0xff9bb4fd)),
                        ),
                        Text(
                          "بيانات المريض ",
                          style: TextStyle(
                            color: Color(0x8e000000),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.featured_play_list_outlined,
                            color: Color(0xff9bb4fd),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20, top: 20),
                child: Text("تسجيل تحليل المريض", style: TextStyle(fontFamily: 'Arial',
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: Colors.black54,
                ),
                ),
              ),

              buildTextField("نوع التحليل"),
              buildTextField("ملاحظات"),
              GestureDetector(
                onTap: () {
                  onClick();
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,

                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color:  Color(0xff9bb4fd),width: 3),
                      color: Color(0xffcbd6fa),
                      borderRadius: BorderRadius.circular(25),
                    ),


                    child: Center(
                        child: Text(
                          'إضافة مع السجل الطبي',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: Colors.black38,
                          ),
                        )),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 150,)
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String hintText) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 9,left: 20,right: 20),
      // width: Get.width * 0.90,
      //  height: Get.height * 0.12,
      //  padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child:  TextField(
        //  controller: controller,
        onChanged: (value){
          if(hintText=="نوع التحليل"){addvisitcontrollerlab.lab_type= value; }
          if (hintText=="ملاحظات" ){addvisitcontrollerlab.details= value;  };

        },
        textDirection: TextDirection.rtl,
        maxLines: null,
        decoration: InputDecoration(
          labelText: '${hintText}' ,

          labelStyle: TextStyle(color: Colors.black45,),
          border: OutlineInputBorder(
            borderSide: BorderSide(),


          ),

        ),
      ),


    );
  }



  void onClick() {

    addvisitcontrollerlab.uploadonclick();
  }


}
