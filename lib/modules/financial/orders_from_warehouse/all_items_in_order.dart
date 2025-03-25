import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/all_items_in_order_controller.dart';
import 'dart:ui';

import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

import '../../../core/class/StatusRequest.dart';
class All_item_in_order extends StatelessWidget {
  const All_item_in_order({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    All_item_in_order_controller controller=Get.put(All_item_in_order_controller());
    return
      RefreshIndicator(
        onRefresh: ()async{
          await controller.get_all_item_in_order();
        },
        child: Scaffold(
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
                    'مواد الطلب',
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
          body:SafeArea(
            child:
            GetBuilder<All_item_in_order_controller>(builder: (controller){

              return
                controller.statusRequest==StatusRequest.loading?
                Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                    controller.data.isEmpty?
                        Container(child: Center(child: Text("لا يوجد مواد لعرضهم",style: TextStyle(color: StaticColor.primarycolor),),),):
                Container(
                  padding: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height*0.5,
                  child:
                  ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, int) {
                      return
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(

                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                       controller.reject_item_request(controller.data[int]['id']);
                                        controller.data.removeAt(int);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 50,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Image.asset(
                                                  "assets/images/cancel.png",
                                                  fit: BoxFit.fill,
                                                )),
                                            const Expanded(child: Text("رفض")),
                                          ],
                                        ),
                                      ),

                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(

                                      child: Container(
                                        height: 60,
                                        width: 50,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Image.asset(
                                                  "assets/images/approved.png",
                                                  fit: BoxFit.fill,
                                                )),
                                            const Expanded(child: Text("قبول")),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        Get.toNamed("/Accept_item_request",arguments: {
                                          "item_id" :controller.data[int]['id']

                                        }
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child:
                                Row(
                                  children: [
                                    Text(
                                      '  (  العدد  :  ${controller.data[int]['Quantity']}  )',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Text(
                                      "${controller.data[int]['Name']}",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                        );
                    },
                  ),
                );
            }),
          ),


        ),
      );
  }



}
