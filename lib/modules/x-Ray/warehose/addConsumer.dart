import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/x-Ray/warehose/warehouseController.dart';



import 'ProductsinDepartment.dart';
class AddConsumer extends StatelessWidget {
  warehouseController controller = Get.put<warehouseController>(warehouseController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<warehouseController>(builder: (controller) {
      return
        Scaffold(
            appBar: AppBar(
              toolbarHeight: 90,
              elevation: 0,
              backgroundColor: Color(0xff9bb4fd),
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
                child: Text(
                  'مواد المستودع',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                controller.addorder();

                Get.toNamed('/warehouseProducts');},
              elevation: 0,


              backgroundColor: Color(0xff9bb4fd),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('طلب مواد',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)
                    // style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            body: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ProductsinDepartment(controller: controller,)
              ],

            ));});
  }
}
