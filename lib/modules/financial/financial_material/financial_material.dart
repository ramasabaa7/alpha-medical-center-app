import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'dart:ui';

import 'package:project_after_update/modules/financial/financial_material/finance_material_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class financial_material extends StatelessWidget {
  const financial_material({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Finanical_material_controller controller=Get.put(Finanical_material_controller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black54,size: 28),
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Expanded(
              child: Text(
                'لائحة المواد',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25, color: Colors.black54),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      body:  SafeArea(child: Container(
        child: GetBuilder<Finanical_material_controller>(builder: (controller){
          return
          controller.statusRequest==StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            ListView.builder(
              itemCount: controller.data.length,

              itemBuilder: (context, index) {
                return  Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Container(

                    width: 300,
                    height: 130,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0xff9bb4fd),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 150,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Column(
                                  children: [
                                    Text('${controller.data[index]['Name']} ',style: TextStyle(color: Color(0xff9bb4fd) ,fontWeight: FontWeight.bold,fontSize: 17),),
                                    SizedBox(height: 10,),
                                    Text('${controller.data[index]['Quantity']}',style: TextStyle(color: Color(0xff9bb4fd) ,fontWeight: FontWeight.bold,fontSize: 17),),



                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(':  اسم المادة ',style: TextStyle(color: Colors.black54 ,fontWeight: FontWeight.w600,fontSize: 18),),
                                    SizedBox(height: 3,),
                                    Text(' :         الكمية ',style: TextStyle(color: Colors.black54 ,fontWeight: FontWeight.w600,fontSize: 18),),
                                  ],
                                ) ,


                              ],
                            ),
                          ),

                          Align(
                            alignment: AlignmentDirectional(1, 1),
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 2,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0x49e1e7f8), Color(0xff9bb4fd)],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0, -1),
                                      end: AlignmentDirectional(0, 1),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      // Container(
                                      //   height: 40,
                                      //   decoration: BoxDecoration(
                                      //     shape: BoxShape.circle,
                                      //     color: Color(0x4cffffff),
                                      //   ),
                                      //   child: IconButton(
                                      //     icon: Icon(
                                      //       Icons.edit,
                                      //       color: Color(0xff9bb4fd),
                                      //       size: 25,
                                      //     ),
                                      //     onPressed: () {
                                      //       Get.defaultDialog(
                                      //         title: 'تعديل السعر',
                                      //         content: Column(
                                      //           children: [
                                      //             Padding(
                                      //               padding: const EdgeInsets.only(left: 30.0,right: 30),
                                      //               child: TextFormField(
                                      //
                                      //                 decoration: InputDecoration(labelText: 'السعر الجديد'),
                                      //                 keyboardType: TextInputType.number,
                                      //                 onChanged: (value){
                                      //                   controller.price=value;
                                      //                 },
                                      //               ),
                                      //             ),
                                      //
                                      //           ],
                                      //         ),
                                      //         actions: [
                                      //           ElevatedButton(
                                      //             onPressed: () {
                                      //               Get.back();
                                      //             },
                                      //             style: ButtonStyle(
                                      //               backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
                                      //             ),
                                      //             child: Text('إلغاء'),
                                      //           ),
                                      //           ElevatedButton(
                                      //             style: ButtonStyle(
                                      //               backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
                                      //             ),
                                      //             onPressed: () {
                                      //               controller.update_material_price(controller.data[index]['id']);
                                      //               Get.back();
                                      //             },
                                      //             child: Text('تعديل السعر'),
                                      //           ),
                                      //         ],
                                      //       );
                                      //     },
                                      //   ),
                                      // ),
                                      GestureDetector(
                                        onTap: (){
                                          Get.bottomSheet(
                                              Container(color: Colors.white,child:Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0x4cffffff),
                                                    ),
                                                    child:Image.asset("assets/images/service_details.png")
                                                ),
                                                Text("تفاصيل المادة",style: TextStyle(fontSize: 16),),

                                              ],),
                                              Divider(),
                                              Text(" ${controller.data[index]['Quantity']} : الكمية   ",),
                                              Divider(),
                                              Text(" ${controller.data[index]['Lower_Limit']} : الحد الأدنى   ",),
                                              Divider(),
                                              Text(" ${controller.data[index]['UpperLimit']} : الحد الأعلى   ",),
                                              Divider(),
                                              Text(" ${controller.data[index]['ProductionDate']} : تاريخ الإنتاج   ",),
                                              Divider(),
                                              Text(" ${controller.data[index]['ExpiryDate']} : تاريخ الإنتهاء   ",),

                                            ],),
                                          )));
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0x4cffffff),
                                          ),
                                          child:Image.asset("assets/images/service_details.png")
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
        }),
      )),


    );
  }
  
    }
