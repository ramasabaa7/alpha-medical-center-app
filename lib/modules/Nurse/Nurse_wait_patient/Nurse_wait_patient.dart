import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/Home/homeNurseController.dart';
import 'package:project_after_update/modules/Nurse/Nurse_wait_patient/Nurse_wait_patient_controller.dart';
import 'package:project_after_update/modules/Nurse/VisitsList/VisitsListController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Nurse_wait_patient extends StatefulWidget {
  const Nurse_wait_patient({Key? key}) : super(key: key);

  @override
  State<Nurse_wait_patient> createState() => _Nurse_wait_patientState();
}

class _Nurse_wait_patientState extends State<Nurse_wait_patient> {
  @override
  Widget build(BuildContext context) {
    homeNurseController controlle_home= Get.find();
    VisitsListController visitsListController= Get.put<VisitsListController>(VisitsListController());
    Nurse_wait_patient_controller controller= Get.put(Nurse_wait_patient_controller());
    bool _isFilterOn = true;
    return Scaffold(
        backgroundColor: Color(0xffffffff),

        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              controller.data.clear();
              Get.back();
            },
          ),
          iconTheme: IconThemeData(

              color: Colors.black54,size: 28),
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Expanded(
                child: Text(
                  'قوائم الإنتظار',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 22, color: Colors.black54),
                ),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        body:
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Transform.scale(
                      scale: 1.5,
                      child: Switch(
                        value: controller.isFilterOn,
                        onChanged: (value) {
                          setState(() {
                            controller.isFilterOn = value;
                          });
                          print(_isFilterOn);
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
              //
              //
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
              //


              SizedBox(height: 15,),
              if(controller.data.isNotEmpty)
                Expanded(

                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext contex, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: GestureDetector(
                            onTap: () async {

                              print("xxxxxxxxxxxxxxxxxxxx");
                              await visitsListController.get_patient_visits(
                                  controller.data[index]['IDPatientRecord']);
                              Get.toNamed("/VisitsListNurse");
                            },


                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      color: Color(0xff9bb4fd),
                                      icon: Icon(
                                        Icons.delete,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        //   itemDetailsController.add()

                                      },
                                    ),
                                    Column(
                                      children: [

                                        Text("${controller.data[index]['FullName']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),
                                        Text("(  ${controller.data[index]['ServiceName']}  )" ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,fontFamily: 'Arial',color: Colors.grey[900])),
                                      ],
                                    ),
                                    IconButton(
                                      color:Color(0xff9bb4fd),
                                      icon: Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        //   itemDetailsController.add()

                                      },
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              else
                Center(
                  child: SizedBox(
                      height: 50,
                      child: Text("لا يوجد دور انتظار",style: TextStyle(fontSize: 20),)),
                )

            ]
        )

    );
  }
}
