import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';
import 'dart:ui';

import '../../../core/class/StatusRequest.dart';
import '../../../static_colors/StaticColors.dart';
import 'home_screen_store_controller.dart';
class orders_from_warehouse extends StatelessWidget {

  const orders_from_warehouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    warehouseControllerstor controllerstor = Get.find();
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
      body:
      _buildMaterialList(controllerstor),


    );
  }

  Widget _buildMaterialList(warehouseControllerstor controller) {

    return ListView.builder(
      itemCount: controller.data_details3.length,
      itemBuilder: (context, index1) {
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          child: Container(
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.data_details3[index1]['item_request_detail'].length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '  (  العدد  : ${controller.data_details3[index1]['item_request_detail'][index]['Quantity']}   )',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "${controller.data_details3[index1]['item_request_detail'][index]['Name']}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
                          child: Text(
                            '12/12/2022',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 19,
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
  }

}
