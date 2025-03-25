import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static_colors/StaticColors.dart';
import 'Depatmentordercontroller.dart';
import 'dep_order.dart';




class department_orders extends StatelessWidget {
  departmentorderController controller = Get.put(departmentorderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'طلبات الاقسام',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),

      ),
      body: GridView.builder(
        itemCount: controller.data_details.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50 ,
            child: Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: StaticColor.primarycolor,
                  width: 2,
                ),

              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric( horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                         controller.data_details[index]['Name'],
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.trip_origin,
                          color: StaticColor.primarycolor,
                        ),
                      ],
                    ),
                  ),


                  ButtonBar(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextButton(
                          child: const Text('رفض', style: TextStyle(fontSize: 18, color: StaticColor.primarycolor),),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('تأكيد الرفض'),
                                  content: Text('هل أنت متأكد من رفض هذا الطلب؟'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('لا'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('نعم'),
                                      onPressed: () {
                                        Get.snackbar(

                                          'تم حذف طلب قسم',
                                          '${controller.data_details[index]['Name']}'
                                          ,
                                          backgroundColor: Colors.white,
                                          colorText:StaticColor.primarycolor,
                                        );
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextButton(
                          child: const Text('عرض',style: TextStyle(fontSize: 18, color: StaticColor.primarycolor)),
                          onPressed: () { Get.toNamed("/dep_order",arguments: {
                            "id" : controller.data_details[index]['id'],
                          });},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
