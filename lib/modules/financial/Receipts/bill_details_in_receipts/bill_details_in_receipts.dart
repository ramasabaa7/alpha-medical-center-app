import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/Receipts/bill_details_in_receipts/bill_details_in_receipts_controller.dart';
import 'package:project_after_update/modules/reception/doctors/doctors_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Bill_details_in_receipts extends StatelessWidget {
  const Bill_details_in_receipts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bill_details_in_receipts_controller controller = Get.put(bill_details_in_receipts_controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
        ),
        body: GetBuilder<bill_details_in_receipts_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            SafeArea(
                child: Container(
                  child: ListView(children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "تفاصيل الفاتورة",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset("assets/images/receipt.png"),
                              ),
                              Text(
                                "مركز ألفا الطبي",
                                style: TextStyle(fontSize: 15, color: Colors.grey),
                              ),

                            ],
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "المبلغ الكلي",
                            style: TextStyle(fontSize: 20,),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.data_details[1]['totalPrice']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "المبلغ بعد الحسم",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.data_details[1]['totalPriceAfterDiscount']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "المبلغ المستلم",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.data_details[1]['receivedMoney']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "الخدمة المطلوبة",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.data_details[0][0]['CenterServiceName']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            " سعر الخدمة",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.data_details[0][0]['CenterServicePrice']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black45,
                          ),
                          const Text(
                            "شركة التأمين",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Text(
                              "${controller.data_details[2]['Name']}",
                              style: TextStyle(
                                  fontSize: 15, color: StaticColor.primarycolor),
                              textAlign: TextAlign.end,
                            ),
                          ),


                        ],

                      ),
                    ),
                  ]),
                )
            );
        })
    );
  }
}
