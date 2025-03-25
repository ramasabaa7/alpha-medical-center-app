import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

import '../../../core/class/StatusRequest.dart';
class orders_from_warehouse extends StatelessWidget {
  const orders_from_warehouse({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Order_from_warehouse_controller controller=Get.put(Order_from_warehouse_controller());
    return
      RefreshIndicator(
        onRefresh: ()async{
          await controller.get_all_orders_incomplete();
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
                  'طلبات المستودع',
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
          GetBuilder<Order_from_warehouse_controller>(builder: (controller){

            return
              controller.statusRequest==StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                  controller.data.isEmpty?
                      Center(child: Container(child: Text("لا يوجد طلبات لعرضهم",style: TextStyle(color: StaticColor.primarycolor),),),):
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
                                child: Center(
                                  child:
                                  GestureDetector(
                                    onTap: (){
                                      Get.toNamed("/All_item_in_order",arguments: {
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


    ),
      );
  }



}
