import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/financial_home/financial_home_controller.dart';

import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Patient_bills extends StatelessWidget {
  const Patient_bills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    financial_home_controller controller = Get.put(financial_home_controller());
    return RefreshIndicator(
      onRefresh: () async {
        await controller.get_all_patient_bills();
      },
      child: Scaffold(
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
        body: SafeArea(
            child: GetBuilder<financial_home_controller>(builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: StaticColor.primarycolor,
                  ),
                )
              :
         controller.data.isEmpty?
         Center(child: Text("لا يوجد فواتير لعرضهم",style: TextStyle(color: StaticColor.primarycolor,fontSize: 15),),):
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
                            padding: const EdgeInsets.all(0),
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
                                            MainAxisAlignment.end,
                                        children: [
                                          controller.data[index]
                                                      ['BillStauts'] ==
                                                  0
                                              ? Text(
                                                  "لم يتم دفع المبلغ",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                              : controller.data[index]
                                                          ['BillStauts'] ==
                                                      2
                                                  ? Text(
                                                      "تم دفع جزء من المبلغ",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .orangeAccent),
                                                    )
                                                  : Text(
                                                      "تم دفع المبلغ كاملا",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                           Text(
                                               ' ${controller.data[index]['FullName']}    ',
                                               textAlign: TextAlign.right,
                                               style: TextStyle(
                                                   color: StaticColor.primarycolor,
                                                   fontSize: 15,
                                                   fontWeight: FontWeight.bold,)),
                                           Text(
                                               '  : اسم المريض ',
                                               textAlign: TextAlign.right,
                                               style: TextStyle(
                                                   color: Colors.black54,
                                                   fontSize: 15,
                                                   fontWeight: FontWeight.bold)),
                                         ],),
                                          Text(
                                              '   تفاصيل الحسم :  ${controller.data[index]['Discount_Details']}  -',
                                              textAlign: TextAlign.right),
                                          Text(
                                              ' ${controller.data[index]['totalPriceAfterDiscount']} : المبلغ بعد الحسم -',
                                              textAlign: TextAlign.right),
                                          Text(
                                              ' نوع الحسم :  ${controller.data[index]['DiscountType']}  -',
                                              textAlign: TextAlign.right),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Divider(
                                                height: 5,
                                                color: Colors.black54),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(': المبلغ المستلم',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 15)),
                                                  Text(
                                                      '${controller.data[index]['receivedMoney']}',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.defaultDialog(
                                                    title:
                                                        "هل تريد حذف هذه الفاتورة ؟",
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                            controller.delete_bill(
                                                                controller.data[
                                                                        index][
                                                                    'Bill_ID']);
                                                            controller.data.removeAt(index);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: StaticColor
                                                                  .primarycolor,
                                                            ),
                                                            child: const Text(
                                                              "نعم",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: StaticColor
                                                                  .primarycolor,
                                                            ),
                                                            child: const Text(
                                                              "لا",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                    "assets/images/delete.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  Get.defaultDialog(
                                                    title: "هل تريد تعديل هذه الفاتورة",
                                                    content:
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (){
                                                            Get.back();
                                                            Get.toNamed("/update_bill",arguments: {
                                                              "Visit_ID":controller.data[index]['Visit_ID'],
                                                              "bill_id" :controller.data[index]['Bill_ID'],
                                                              "name":controller.data[index]['FullName']
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
                                                  child: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image.asset("assets/images/pen.png"),
                                              )),
                                              Column(
                                                children: [
                                                  Text(': المبلغ الكلي',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 15)),
                                                  Text(
                                                      '${controller.data[index]['totalPrice']}',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 15)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                child: Text(
                                                  "إنشاء وصل",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  Get.toNamed(
                                                      "/Add_receipts_from_patient_bill",
                                                      arguments: {
                                                        "Bill_ID":
                                                        controller.data[index]
                                                        ['Bill_ID']
                                                      });
                                                },
                                              ),
                                              TextButton(
                                                child: Text(
                                                  "استرجاع مبلغ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  controller.pay_back(controller.data[index]['Bill_ID']);
                                                },
                                              ),
                                            ],
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
        })),
      ),
    );
  }
}
