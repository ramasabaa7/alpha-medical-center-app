import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/Receipts/Receipts_controller.dart';
import 'package:project_after_update/modules/financial/financial_invoices_archive/finanical_invoice_archive_controller.dart';
import 'package:project_after_update/modules/financial/maintenance/maintenace_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Maintenance extends StatelessWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Maintenance_controller controller = Get.put(Maintenance_controller());
    return RefreshIndicator(
      onRefresh: ()async{
        await controller.get_all_maintenance_request();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          onPressed: (){
            Get.toNamed("/Add_maintenance_request");
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'طلبات الصيانة',
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          backgroundColor: Color(0xff9bb4fd),
          elevation: 0,
        ),
        body: SafeArea(
            child: GetBuilder<Maintenance_controller>(builder: (controller) {
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
                            onTap: (){
                              Get.toNamed("/Payments_for_maintenance",arguments: {
                                "maintenance_req_id":controller.data[index]['id']
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
                                              "assets/images/maintenance.png"),
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
                                                      "هل تريد تعديل  الطلب   ؟",
                                                      content: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: (){
                                                              Get.back();
                                                              Get.toNamed("/update_maintenance_request",arguments: {
                                                                "id":controller.data[index]['id'],
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
                                            GestureDetector(onTap: (){
                                              Get.toNamed("/Add_payments_maintenance_request",arguments: {
                                                "maintenanceRequests_id":controller.data[index]['id']
                                              });
                                            },child: Container(

                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: StaticColor.primarycolor
                                              ),
                                                child: Text("إضافة مدفوعات",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),))),
                                            Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Get.defaultDialog(
                                                      title: "هل تريد حذف هذا الطلب ؟",
                                                      content: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: (){
                                                              Get.back();
                                                              controller.delete_maintenance(controller.data[index]['id']);
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
