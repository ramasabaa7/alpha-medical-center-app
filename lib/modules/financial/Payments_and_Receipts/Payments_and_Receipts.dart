
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/financial/Payments_and_Receipts/payments_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';


class Payments_and_Receipts extends StatelessWidget {
  const Payments_and_Receipts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Payments_controller controller =Get.put(Payments_controller());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9bb4fd),
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 19),
            tabs: [
              Tab(text: 'المدفوعات '),
            ],
          ),
        ),
        body: TabBarView(
          children: [
       GetBuilder<Payments_controller>(builder: (controller){
         return  Column(
           children: [
             SizedBox(
               height: 20,
             ),
             Expanded(
               child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: controller.data.length,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: GestureDetector(
                       child: Card(
                         shape: RoundedRectangleBorder(
                           side: BorderSide(
                             color: Color(
                                 0xff9bb4fd), // تحديد لون الحدود الجديد
                             width: 2.0, // تحديد عرض الحدود الجديدة
                           ),
                           borderRadius: BorderRadius.circular(
                               10.0), // تحديد شكل الحواف
                         ),
                         // باقي الأكواد هنا
                         margin: EdgeInsets.only(right: 20, left: 20),
                         child: Column(
                           children: [
                             ListTile(
                               title: Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     height: 50,
                                     width: 50,
                                     child: Image.asset(
                                         "assets/images/export.png"),
                                   ),
                                   Text('الاسم  : ${controller.data[index]['Name']}',
                                       textAlign: TextAlign.right,
                                       style: TextStyle(
                                           color: Colors.black54,
                                           fontSize: 15)),
                                 ],
                               ),
                               subtitle: Column(
                                 crossAxisAlignment:
                                 CrossAxisAlignment.end,
                                 children: [
                                   Text(
                                       'التفاصيل :  ${controller.data[index]['Details']}   -',
                                       textAlign: TextAlign.right),
                                   Text(
                                       ' تاريخ التعديل :  ${controller.data[index]['updated_at']}  -',
                                       textAlign: TextAlign.right),
                                   Text(
                                       ' تاريخ الإنشاء :  ${controller.data[index]['created_at']}  -',
                                       textAlign: TextAlign.right),
                                   Text(
                                       ' السعر  :  ${controller.data[index]['Price']}  -',
                                       textAlign: TextAlign.right),
                                   Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: Divider(
                                         height: 5, color: Colors.black54),
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   );
                 },
               ),
             ),
           ],
         );
       })
          ],
        ),
      ),
    );
  }


}

