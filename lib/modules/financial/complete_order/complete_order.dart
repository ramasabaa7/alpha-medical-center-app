import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/financial/complete_order/complete_order_controller.dart';
import 'dart:ui';

import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

import '../../../core/class/StatusRequest.dart';
class Complete_order extends StatelessWidget {
  const Complete_order({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Complete_order_controller controller=Get.put(Complete_order_controller());
    return
      Scaffold(
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

          Text(
                  ' طلبات المستودع المكتملة',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25, color: Colors.black54),
                ),
              
            ],
          ),
        ),
        body:SafeArea(
          child:
          GetBuilder<Complete_order_controller>(builder: (controller){

            return
              controller.statusRequest==StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
              ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    //  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    padding: EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0xff9bb4fd),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(

                        children: [

                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${controller.data[index]['Type']}",style: TextStyle(color: StaticColor.primarycolor),),
                              Text(" : نوع الطلب",style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Text("${controller.data[index]['created_at']}",style: TextStyle(color: StaticColor.primarycolor),),
                              Text(" : تاريخ الإنشاء",style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              Text("${controller.data[index]['updated_at']}",style: TextStyle(color: StaticColor.primarycolor),),
                              Text(" : تاريخ التعديل ",style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),

                          SizedBox(height: 10),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 2,
                                ),
                                child:
                                Container(
                                  padding: EdgeInsets.all(5),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed("/All_item_in_order_complete",arguments: {
                                            "order_id":controller.data[index]['id']
                                          });
                                        },
                                        child: Text(
                                          'عرض مواد الطلب',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed("/Add_payments_orders",arguments: {
                                              "order_id":controller.data[index]['id']
                                          });
                                        },
                                        child: Text(
                                          'إضافة مدفوعات',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed("/Payments_for_orders",arguments: {
                                            "order_id":controller.data[index]['id']
                                          });
                                        },
                                        child: Text(
                                          'عرض مدفوعات',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
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
                  );
                },
              );
          }),
        ),


      );
  }



}
