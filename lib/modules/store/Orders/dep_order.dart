import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../static_colors/StaticColors.dart';

import 'dep_ordercontroller.dart';
class deporderPage extends StatefulWidget {
  @override
  dep_order createState() => dep_order();
}

class dep_order extends State<deporderPage> {
  dep_ordercontroller controller = Get.put(dep_ordercontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<dep_ordercontroller>(builder: (controller) {
      return
      Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'الطلب',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body:  controller.statusRequest == StatusRequest.loading?
      Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
      ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 160, // ارتفاع المحتوى
            child: GridView.builder(
              itemCount: controller.data_details.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3.3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: StaticColor.primarycolor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                children :[
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            ' اسم المنتج : ${controller.data_details[index]['CenterMaterialName']}',
                            style: TextStyle(fontSize: 18),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(width: 10),
                          Text(
                            ' الكمية المطلوبة : ${controller.data_details[index]['QuantityInOrder']}',
                            style: TextStyle(fontSize: 18),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                           controller.acceptmatirial4(controller.data_details[index]['ItemRequestID']);

                           setState(() {
                             controller.data_details.removeAt(index);
                           });
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                          StaticColor.primarycolor,
                        ),
                        child: Text('قبول'),
                      ),
                      SizedBox(width: 30),
                      ElevatedButton(
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

                                        'تم حذف الطلب',
                                        ''
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
                        style: ElevatedButton.styleFrom(
                          primary:
                          StaticColor.primarycolor, // تعيين اللون الأزرق كلون للزر
                        ),
                        child: Text('رفض'),
                      ),
                    ],
                  ),











                ])
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );});
  }
}
