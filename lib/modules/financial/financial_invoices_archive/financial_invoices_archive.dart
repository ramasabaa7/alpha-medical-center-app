import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Financial_invoices_archive extends StatelessWidget {
  const Financial_invoices_archive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Finanical_invoice_archive_controller controller =Get.put(Finanical_invoice_archive_controller());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 170, bottom: 20),
            child: Text(
              'الفواتير',
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color(0xff9bb4fd),
          elevation: 0,
        ),
        body:
        SafeArea(
          child:
         GetBuilder<Finanical_invoice_archive_controller>(builder: (controller){
           return
           controller.statusRequest==StatusRequest.loading?
               Center(child:CircularProgressIndicator(color: StaticColor.primarycolor,) ,):
             Column(
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
                                 title: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                   controller.data[index]['Status']==0?
                                   Text("لم يتم دفع المبلغ",style: TextStyle(color: Colors.red),):
                                   controller.data[index]['Status']==2?
                                   Text("تم دفع جزء من المبلغ",style: TextStyle(color: Colors.orangeAccent),):
                                   Text("تم دفع المبلغ كاملا",style: TextStyle(color: Colors.green),),


                                 ],),
                                 subtitle: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                      Text('${controller.data[index]['patient_visit_detail']['patient_medical_record']['FullName']}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: StaticColor.primarycolor, fontSize: 20)),
                                      Text(' : اسم المريض  ',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.black54, fontSize: 20)),
                                    ],),
                                     Text('  شركة التأمين :  ${controller.data[index]['insurance_companie']['Name']}  -',
                                         textAlign: TextAlign.right),

                                     Text(' ${controller.data[index]['totalPriceAfterDiscount']} : المبلغ بعد الحسم -',
                                         textAlign: TextAlign.right),
                                     Text(' نوع الحسم :  ${controller.data[index]['DiscountType']}  -',
                                         textAlign: TextAlign.right),
                                


                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Divider(height: 5,color: Colors.black54),
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [

                                         Column(
                                           children: [
                                             Text(': المبلغ المستلم',
                                                 textAlign: TextAlign.right,style: TextStyle(
                                                     color: Colors.black54,
                                                     fontSize: 15)),
                                             Text('${controller.data[index]['receivedMoney']}',
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                     color: Colors.black45,
                                                     fontSize: 15)),

                                           ],
                                         ),

                                         SizedBox(width: 100,),
                                         Column(
                                           children: [
                                             Text(': المبلغ الكلي',
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                     color: Colors.black54,
                                                     fontSize: 15)),
                                             Text('${controller.data[index]['totalPrice']}',
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                     color: Colors.black38,
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
                       ),
                     );
                   },
                 ),
               ),
             ],
           );
         })
        ),
    );
  }
}
