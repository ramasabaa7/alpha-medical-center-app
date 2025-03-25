import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/financial/complete_order/all_items_in_order_complete_controller.dart';
import 'dart:ui';

import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

import '../../../core/class/StatusRequest.dart';
import 'complete_order_controller.dart';
class All_item_in_order_complete extends StatelessWidget {
  const All_item_in_order_complete({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    All_item_in_order_complete_controller controller=Get.put(All_item_in_order_complete_controller());
    return
      RefreshIndicator(
        onRefresh: ()async{
          await controller.get_all_item_in_order_complete();
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
            GetBuilder<All_item_in_order_complete_controller>(builder: (controller){

              return
                controller.statusRequest==StatusRequest.loading?
                Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height*0.8,
                    child:
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      itemBuilder: (context, int) {
                        return
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Row(

                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
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
