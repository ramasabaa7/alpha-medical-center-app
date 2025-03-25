import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/x-Ray/home/homeX-RayController.dart';
import '../../../GetxBindings/X_Ray/homeX_rayBinding.dart';
import 'PatientList.dart';
import 'Type_servece.dart';

import 'homeX-RayController.dart';

class homex_ray extends  StatelessWidget{


  homex_ray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(homex_rayController());
    return GetBuilder<homex_rayController>(builder: (controller) {
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
                          //  _increment_requrst_SalaryDialog();
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
                  Padding(
                    padding: const EdgeInsets.only(right: 35, bottom: 3, top: 10),
                    child: Text("الأشعة",
                      style: TextStyle(fontFamily: 'Arial', fontSize: 32, color: Color(
                          0xff36414d),),
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(right: 38, bottom: 14, top: 3),
                    child: Text("مركز ألفا الطبي",
                      style: TextStyle(fontFamily: 'Arial',
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.black38),
                    ),),
                  Center(
                    child: Container(
                      width: Get.width * 0.90,
                      height: Get.height * 0.17,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,

                            colors: [
                              Color(0xffe5ebfc),
                              Color(0xffbecefd),
                              Color(0xff9bb4fd)
                            ]

                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: Get.width * 0.45,
                            height: Get.height * 0.17,
                            decoration: BoxDecoration(
                              // color: Color(0x6E649EFF),

                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/images/pic.png"),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text('تحويل المرضى',  style: TextStyle(fontFamily: 'Arial',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black45),),
                              SizedBox(height: 10,),
                              Obx(() => OutlinedButtonTheme(

                                data: OutlinedButtonThemeData(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(

                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color :Color(0xff1e364d,)),

                                      ),

                                    ),
                                  ),
                                ),
                                child: OutlinedButton(

                                    onPressed: () => controller.toggleStop(),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Icon(Icons.timer_sharp, size: 25,
                                            color:  Color(0xff494e56,),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all( 6.0),
                                          child: Text(controller.isStoping.value
                                              ? 'إيقاف  '
                                              : 'أستئناف',
                                            style: TextStyle(fontFamily: 'Arial',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w200,
                                                color:Color(0xff494e56,)),),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 120, bottom: 20, top: 20),
                    child: Text("الخدمات المتوفرة", style: TextStyle(fontFamily: 'Arial',
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                      color:Colors.black87 ,
                    ),
                    ),
                  ),

                  Type_servic( controller: controller) ,
                ],
              )));

    });

  }


}

