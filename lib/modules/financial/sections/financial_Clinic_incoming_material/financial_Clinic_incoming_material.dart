import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class financial_Clinic_incoming_material extends StatelessWidget {
  const financial_Clinic_incoming_material({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 170, bottom: 20),
            child: Text(
              'المواد المستهلكة',
              style: TextStyle(color: Colors.black54, fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color(0xff9bb4fd),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xff9bb4fd), // تحديد لون الحدود الجديد
                          width: 2.0, // تحديد عرض الحدود الجديدة
                        ),
                        borderRadius:
                        BorderRadius.circular(10.0), // تحديد شكل الحواف
                      ),
                      // باقي الأكواد هنا
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          ListTile(

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 15,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Column(
                                      children: [
                                        Text(':  الكمية المستخدمة',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 17)),
                                        Text('20',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    SizedBox(width: 65,),
                                    Column(
                                      children: [
                                        Text(': اسم المادة',
                                            textAlign: TextAlign.right,style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 17)),
                                        Text('قطن',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15)),

                                      ],
                                    ),



                                  ],
                                ),
                                SizedBox(height: 15,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
