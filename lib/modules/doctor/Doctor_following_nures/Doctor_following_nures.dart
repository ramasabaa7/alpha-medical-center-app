import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/doctor/Doctor_following_nures/Doctor_following_nures_controller.dart';

import 'package:project_after_update/modules/doctor/Home/homeController.dart';
import 'package:project_after_update/modules/doctor/Home/patientList.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Nurse {
  final String name;

  Nurse(this.name);
}





class Doctor_following_nures extends StatelessWidget {
  Doctor_following_nures_controller controller = Get.put(
      Doctor_following_nures_controller());

  Future<void> _selectDateStart(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDateStart.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.selectedDateStart.value = picked;
    }
  }

  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDateEnd.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.selectedDateEnd.value = picked;
    }
  }

  /////////////////////////////


  Future<void> _selectTimeStart(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: controller.selectedTimeStart.value,
    );

    if (picked != null) {
      controller.selectedTimeStart.value = picked;
    }
  }

  Future<void> _selectTimeEnd(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: controller.selectedTimeEnd.value,
    );

    if (picked != null) {
      controller.selectedTimeEnd.value = picked;
    }
  }


  @override
  Widget build(BuildContext context) {
    final Function(int) onNurseSelected;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor:Color(0xff9bb4fd) ,
          title: Padding(
            padding: const EdgeInsets.only(left: 220.0, top: 20,bottom: 10),
            child: Text('',style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300,fontSize: 23)),
          ),
          bottom: TabBar(
            indicatorColor:Color(0xffffffff),
            tabs: [
              Tab(
                child: Text(
                  'حجز ممرض',
                  style: TextStyle(color: Colors.black54,fontSize: 17),
                ),
              ),
              Tab(
                child: Text(
                  'الحجوزات',
                  style: TextStyle(color: Colors.black54,fontSize: 17),
                ),
              ),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildEmployeeList(context),
            _nuresee(),

          ],
        ),
      ),
    );
  }


  Widget _buildEmployeeList(BuildContext context) {
    return GetBuilder<Doctor_following_nures_controller>(
      init: Doctor_following_nures_controller(),
      builder: (controller) => Scaffold(
        body: SafeArea(

          child: Column(
            children: [
              Row(
                children: [
                  Obx(
                        () =>
                            GestureDetector(
                              onTap: (){
                                _selectDateStart(context);
                              },
                              child: Container(
                                width: 180,
                                height: 40,

                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Center(
                                    child:Text(
                                      DateFormat('yyyy/MM/dd').format(
                                          controller.selectedDateStart.value),
                                      style: TextStyle(fontSize: 17,color: Colors.black45),
                                    ),),
                                // ),
                              ),
                            ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _selectDateStart(context);
                      },
                    child: Container(
                      width: 180,
                      height: 40,

                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff9bb4fd), width: 3),
                        color: Color(0xffcbd6fa),
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: Center(
                          child: Text(
                            'اختر يوم بداية الحجز',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: Colors.black87,
                            ),
                          )),
                      // ),
                    ),
                  ),

                ]
              ),
              Row(
                  children: [
                    Obx(
                          () =>
                          GestureDetector(
                            onTap: (){
                              _selectDateStart(context);
                            },
                            child: Container(
                              width: 180,
                              height: 40,

                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff9bb4fd), width: 3),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(25),
                              ),

                              child: Center(
                                child: Text(
    controller.selectedTimeStart.value.format(context),
                                  style: TextStyle(fontSize: 18,color: Colors.black45),
                                ),),
                              // ),
                            ),
                          ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _selectTimeStart(context);
                      },
                      child: Container(
                        width: 180,
                        height: 40,

                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9bb4fd), width: 3),
                          color: Color(0xffdde4fc),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Center(
                            child: Text(
                              'اختر وقت بداية الحجز',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black87,
                              ),
                            )),
                        // ),
                      ),
                    ),

                  ]
              ),
              Row(
                  children: [
                    Obx(
                          () =>
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              width: 180,
                              height: 40,

                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff9bb4fd), width: 3),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(25),
                              ),

                              child: Center(
                                child: Text(
                                  DateFormat('yyyy/MM/dd').format(
                                      controller.selectedDateEnd.value),
                                  style: TextStyle(fontSize: 18,color: Colors.black45),
                                ),),
                              // ),
                            ),
                          ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _selectDateEnd(context);
                      },
                      child: Container(
                        width: 180,
                        height: 40,

                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9bb4fd), width: 3),
                          color: Color(0xffdde4fc),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Center(
                            child: Text(
                              'اختر تاريخ نهاية الحجز',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black87,
                              ),
                            )),
                        // ),
                      ),
                    ),

                  ]
              ),
              Row(
                  children: [
                    Obx(
                          () =>
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              width: 180,
                              height: 40,

                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff9bb4fd), width: 3),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(25),
                              ),

                              child: Center(
                                child: Text(
                                  controller.selectedTimeEnd.value.format(context),
                                  style: TextStyle(fontSize: 18,color: Colors.black45),
                                ),),
                              // ),
                            ),
                          ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _selectTimeEnd(context);
                      },
                      child: Container(
                        width: 180,
                        height: 40,

                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff9bb4fd), width: 3),
                          color: Color(0xffdde4fc),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Center(
                            child: Text(
                              'اختر وقت نهاية الحجز',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color: Colors.black87,
                              ),
                            )),
                        // ),
                      ),
                    ),

                  ]
              ),


             Center(child: Text("اختر اسم الممرض ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.black87),))
,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    final nurse = controller.data[index];
                    final isSelected = controller.idSelected == nurse['id'];

                    return ListTile(
                      leading: Icon(
                        isSelected ? Icons.check : Icons.person,
                        color: isSelected ?Color(0xff9bb4fd) : null,
                        size: 32,
                      ),
                      title: Text(nurse['name']),
                      onTap: () {
                        controller.selectNurse(nurse['id']);
                        print(controller.idSelected);
                      },
                    );
                  },
                ),
              ),

              GestureDetector(
                onTap: (){
                  controller.Add_follow_nurse(context);
                },
                child: Container(
                  width: 180,
                  height: 40,

                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Center(
                    child: Text("تاكيد الحجز",
                      style: TextStyle(fontSize: 18,color: Colors.black45),
                    ),),
                  // ),
                ),
              ),
            ],
          ),

        )

      ),
    );
  }
  Widget _nuresee() {
    return ListView.builder(
      itemCount: controller.data2.length,
      itemBuilder: (context, index) {
        final nurse = controller.data2[index];
        // String? name_nurse = getName_nurse(nurse['ID_UserFollow']);
        // String? name_doctor = getName_doctor(nurse['ID_User']);
        String nameNurse = controller.nurseNames[index].toString();
        String nameDoctor = controller.doctorNames[index].toString();
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                SizedBox(width: 180,),
                Text(" ${nameNurse}",style: TextStyle(color: Colors.black54,fontSize: 15)),
                Text("  اسم الطبيب",style: TextStyle(color: Colors.black87,fontSize: 17),),

              ],
            ),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 180,),
                  Text("${nameDoctor}",style: TextStyle(color: Colors.black54,fontSize: 15)),
                  Text("  اسم الممرض",style: TextStyle(color: Colors.black87,fontSize: 17),),

                ],
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "(${nurse['StartTime']} --> ${nurse['EndTime']})",
                        style: TextStyle(color: Color(0xff9bb4fd), fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Divider(
                height: 2,
                color: Colors.black45,
              )
            ],
          ),
          onTap: () {
            // Do something
          },
        );
      },
    );
  }







}
