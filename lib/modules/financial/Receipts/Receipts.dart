import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/Receipts/Receipts_controller.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Receipts extends StatelessWidget {
  const Receipts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    receipts_controller controller = Get.put(receipts_controller());
    return RefreshIndicator(
      onRefresh: ()async{
        await controller.get_all_receipts();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 170, bottom: 20),
            child: Text(
              'الإيصالات',
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color(0xff9bb4fd),
          elevation: 0,
        ),
        body: SafeArea(
            child: GetBuilder<receipts_controller>(builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: StaticColor.primarycolor,
                  ),
                )
              : Column(
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
                              onTap: () {
                                Get.toNamed("/Bill_details_in_receipts",
                                    arguments: {
                                      "bill_id": controller.data[index]['ID_Bill']
                                    });
                              },
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
                                                "assets/images/receipt.png"),
                                          ),
                                          Row(children: [
                                            Text('${controller.data[index]['FullName']}',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: StaticColor.primarycolor,
                                                    fontSize: 20)),
                                            Text(' : اسم المريض ',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 20)),
                                          ],),
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
                                              ' السعر :  ${controller.data[index]['price']}  -',
                                              textAlign: TextAlign.right),
                                          Text(
                                              ' تاريخ الإنشاء :  ${controller.data[index]['created_at']}  -',
                                              textAlign: TextAlign.right),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Divider(
                                                height: 5, color: Colors.black54),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  GestureDetector(
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: Image.asset(
                                                          "assets/images/pen.png"),
                                                    ),
                                                    onTap: (){
                                                      Get.defaultDialog(
                                                        title:
                                                        "هل تريد تعديل نوع الوصل   ؟",
                                                        content: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceAround,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (){
                                                                Get.back();
                                                                Get.toNamed("/update_receipts",arguments: {
                                                                  "id":controller.data[index]['id'],
                                                                  "id_bill":controller.data[index]['ID_Bill']
                                                                  // "id_section":controller.data_type_section[index]['id_section']
                                                                });
                                                              },
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsets.all(5),
                                                                alignment: Alignment.center,
                                                                height: 50,
                                                                width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                    0.2,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: const Text(
                                                                  "نعم",
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20),
                                                                ),
                                                              ),

                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsets.all(5),
                                                                alignment: Alignment.center,
                                                                height: 50,
                                                                width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                    0.2,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: const Text(
                                                                  "لا",
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20),
                                                                ),
                                                              ),

                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Text('تعديل',
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        "assets/images/service_details.png"),
                                                  ),
                                                  Text('التفاصيل الكلية',
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: (){
                                                      Get.defaultDialog(
                                                        title: "هل تريد حذف هذا الإيصال ؟",
                                                        content: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceAround,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: (){
                                                                Get.back();
                                                                controller.delete_receipt(controller.data[index]['id']);
                                                              },
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsets.all(5),
                                                                alignment: Alignment.center,
                                                                height: 50,
                                                                width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                    0.2,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: const Text(
                                                                  "نعم",
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20),
                                                                ),
                                                              ),

                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsets.all(5),
                                                                alignment: Alignment.center,
                                                                height: 50,
                                                                width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                    0.2,
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      10),
                                                                  color: StaticColor
                                                                      .primarycolor,
                                                                ),
                                                                child: const Text(
                                                                  "لا",
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20),
                                                                ),
                                                              ),

                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                      child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        "assets/images/delete.png"),
                                                  ),

                                                  ),
                                                  Text('حذف',
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 15)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          )
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
        })),
      ),
    );
  }
}
