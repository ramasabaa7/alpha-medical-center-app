import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:project_after_update/modules/doctor/Home/homeController.dart';
import 'package:project_after_update/modules/doctor/Home/patientList.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:project_after_update/modules/doctor/bookings/CalendarController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';


class Home extends StatelessWidget  {
  // homeController controller = Get.put(homeController());
  // DoctorBookingController c = Get.put<DoctorBookingController>(DoctorBookingController());
  @override
  Widget build(BuildContext context) {
    Get.put(homeController());
    return GetBuilder<homeController>(builder: (controller) {

    bool isFilterOn = true;
    return Scaffold(

        body: SafeArea(
          child: Column(

            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,left: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.logout,
                        size: 30,
                        color:Color(0xff9bb4fd),
                      ),
                      //  color: Color(0xff3366ff)
                      //,
                      onPressed: () {
                      controller.logout();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_box_outlined,
                        size: 30,
                        color:Color(0xff9bb4fd),
                      ),
                      //  color: Color(0xff3366ff)
                      //,
                      onPressed: () {
                        _increment_requrst_SalaryDialog();
                      },
                    ),
                  ),
SizedBox(width: 200,),
                  Obx(() =>
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 30.0, top: 30.0, bottom: 7.0,),
                        child: Container(
                          width: 55,
                          height: 55,
                          //color:Color(0xFF649EFF) ,
                          decoration: BoxDecoration(
                            color:  Color(0xff9bb4fd),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Stack(
                              children: [
                                Icon(Icons.notifications,
                                    size: 38, color: Color(0xFFFFFFFF)),
                                if (controller.notificationCount.value > 0)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 15,
                                        minHeight: 15,
                                      ),
                                      child: Text(
                                        '${controller.notificationCount.value}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            onPressed: () {
                              controller.incrementNotificationCount();
                              print(controller.notificationCount.value);
                            },
                          ),
                        ),
                      )),

                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 35, bottom: 3, top: 10),
                child: Text("الطبيب",
                  style: TextStyle(fontFamily: 'Arial', fontSize: 32, color: Color(
                      0xff36414d),),
                ),),
              const Padding(
                padding: EdgeInsets.only(right: 38, bottom: 14, top: 3),
                child: Text("مركز ألفا الطبي",
                  style: TextStyle(fontFamily: 'Arial',
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.black38),
                ),),
              Divider(
                height: 5,
                color: Colors.black38,
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Transform.scale(
                      scale: 1.5,
                      child: Switch(
                        value: controller.isFilterOn,
                        onChanged: (value) {

                            controller.isFilterOn = value;

                         // print(_isFilterOn);
                          if(controller.isFilterOn==false){
                            controller.changstatuslabbyidservic(0);}
                          else{
                            controller.changstatuslabbyidservic(1);
                          }
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: StaticColor.primarycolor,
                        inactiveThumbColor: Colors.black12,
                        inactiveTrackColor: Colors.black12,
                      ),

                    ),
                    SizedBox(width: 15,),

                    Text(
                      'تحويل المرضى',
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          color: Colors.black45),
                    ),

                  ]),


              // Center(
              //   child: Container(
              //     width: Get.width * 0.90,
              //     height: Get.height * 0.17,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topRight,
              //           end: Alignment.bottomLeft,
              //
              //           colors: [
              //             Color(0xffe5ebfc),
              //             Color(0xffbecefd),
              //             Color(0xff9bb4fd)
              //           ]
              //
              //       ),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           width: Get.width * 0.45,
              //           height: Get.height * 0.17,
              //           decoration: BoxDecoration(
              //             // color: Color(0x6E649EFF),
              //
              //             borderRadius: BorderRadius.circular(20),
              //             image: DecorationImage(
              //               image: AssetImage("assets/images/pic.png"),
              //             ),
              //           ),
              //         ),
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text('تحويل المرضى',  style: TextStyle(fontFamily: 'Arial',
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w200,
              //                 color: Colors.black45),),
              //             SizedBox(height: 10,),
              //             Obx(() => OutlinedButtonTheme(
              //
              //               data: OutlinedButtonThemeData(
              //                 style: ButtonStyle(
              //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //                     RoundedRectangleBorder(
              //
              //                       borderRadius: BorderRadius.circular(18.0),
              //                       side: BorderSide(color :Color(0xff1e364d,)),
              //
              //                     ),
              //
              //                   ),
              //                 ),
              //               ),
              //               child: OutlinedButton(
              //
              //                   onPressed: () => controller.toggleStop(),
              //                   child: Row(
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.all(6.0),
              //                         child: Icon(Icons.timer_sharp, size: 25,
              //                           color:  Color(0xff494e56,),
              //                         ),
              //                       ),
              //                       SizedBox(width: 10,),
              //                       Padding(
              //                         padding: const EdgeInsets.all( 6.0),
              //                         child: Text(controller.isStoping.value
              //                             ? 'إيقاف  '
              //                             : 'أستئناف',
              //                           style: TextStyle(fontFamily: 'Arial',
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.w200,
              //                               color:Color(0xff494e56,)),),
              //                       ),
              //                     ],
              //                   )
              //               ),
              //             ),
              //             ),
              //           ],
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(right: 120, bottom: 20, top: 20),
                child: Text("قائمة مرضى اليوم", style: TextStyle(fontFamily: 'Arial',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff36414d),
                ),
                ),
              ),

              patientList(controller: controller,),
            ],



          ),
        ));});
  }

  void _increment_requrst_SalaryDialog() {
    homeController controller = Get.find();
    Get.defaultDialog(
      title: ' طلب زيادة راتب ',
      content: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: TextFormField(
              onChanged: (val) {
                controller.detaile = val;
              },
              decoration: InputDecoration(labelText: 'أدخل تفاصيل الطلب'),
              maxLines: 3,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
          ),
          child: Text('إلغاء'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
          ),
          onPressed: () {
            controller.increment_requrst_Salary();
            Get.back();
          },
          child: Text('إرسال الطلب'),
        ),
      ],
    );
  }
}

