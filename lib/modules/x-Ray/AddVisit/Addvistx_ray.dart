import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../static_colors/StaticColors.dart';
import '../home/homeX-RayController.dart';
import 'AddvisitcontrollerX_ray.dart';

class Addvisitx_ray extends StatelessWidget {

  File? file;
  AddvisitcontrollerX_ray addvisitcontrollerX_ray =Get.find();
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
            '${addvisitcontrollerX_ray.name}',
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
                    Get.toNamed('/VisitsListX_Ray',arguments: {
                      "RequiredPatientID" : addvisitcontrollerX_ray.id_requrd,
                      "IDPatientRecord" : addvisitcontrollerX_ray.id_patient,
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
                child: Text(
                  "تسجيل صورة المريض", style: TextStyle(fontFamily: 'Arial',
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  color: Colors.black54,
                ),
                ),
              ),


              buildTextField("ملاحظات"),
              GestureDetector(
                onTap: () {
                  uploadtest();

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
                          'إرفاق الصورة ',
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

              GestureDetector(
                onTap: () {

                   showDialog(
                     context: context,
                     builder: (BuildContext context) {
                       return AlertDialog(
                         title: Text('تأكيد الصورة'),
                         content: Text('هل أنت متأكد من رفع هذه الصورة؟'),
                         actions: <Widget>[
                           TextButton(
                             child: const Text('لا'),
                             onPressed: () {

                               Navigator.of(context).pop();
                             },
                           ),
                           TextButton(
                             child: const Text('نعم'),
                             onPressed: () {
                               onClick();

                               Navigator.of(context).pop();
                             },
                           ),
                         ],
                       );
                     },
                   );



                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,

                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff9bb4fd), width: 3),
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

    return Container(
      margin: const EdgeInsets.only(bottom: 9, left: 20, right: 20),

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value){

          if (hintText=="ملاحظات" ){addvisitcontrollerX_ray.details= value;  };

        },


        textDirection: TextDirection.rtl,
        maxLines: null,
        decoration: InputDecoration(
          labelText: '${hintText}',

          labelStyle: TextStyle(color: Colors.black45,),
          border: OutlineInputBorder(
            borderSide: BorderSide(),


          ),

        ),
      ),


    );

  }

  void uploadtest() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String? path = result.files.single.path;
        addvisitcontrollerX_ray.path =path ;
        file = File(path!);

        String? filename = file?.path
            .split("/")
            .last;
      } else {
        // User canceled the picker
      }
    }
    catch (e) {
      print(e);
    }
  }
  void onClick()async  {

    addvisitcontrollerX_ray.uploadonclick();


  }
}