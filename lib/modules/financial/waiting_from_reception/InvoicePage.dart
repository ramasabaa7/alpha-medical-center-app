import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/invoice_page_controller.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/waiting_from_reception_Controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Invoice_page_controller controller=Get.put(Invoice_page_controller());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'إنشاء الفاتورة',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ],
        )

      ),
      body: SafeArea(
        child: GetBuilder<Invoice_page_controller>(builder: (controller){
          return
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ': اسم المريض ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 12),
                      Text(
                        '${controller.name}',
                        style: TextStyle(fontSize: 16,color: StaticColor.primarycolor),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 15),
                      Divider(height: 2,color: Colors.black54,endIndent: 20,indent: 20),
                      SizedBox(height: 15),
                      Text(
                        'الخدمات',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 8),
                    GetBuilder<Invoice_page_controller>(builder: (controller){
                      return controller.statusRequest==StatusRequest.loading?
                          Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                          controller.data_details.isEmpty?
                              Center(child: Container(child: Text("لا يوجد خدمات لعرضهم",style: TextStyle(color: StaticColor.primarycolor),),)):
                        Container(
                       // padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.builder(
                            itemCount: controller.data_details.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                // height:
                                // MediaQuery.of(context).size.height * 0.1,
                                // width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: StaticColor.thirdgrey.withAlpha(30),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title:
                                                "هل تريد حذف هذه الخدمة ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                        controller.delete_service_for_patienr(
                                                            controller.data_details[
                                                            index][
                                                            'id']);
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(5),
                                                        alignment:
                                                        Alignment.center,
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
                                                              .circular(10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "نعم",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
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
                                                        alignment:
                                                        Alignment.center,
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
                                                              .circular(10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "لا",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 50,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Image.asset(
                                                        "assets/images/delete.png",
                                                        fit: BoxFit.fill,
                                                      )),
                                                  const Expanded(
                                                      child: Text("حذف")),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child:
                                      Column(
                                        children: [
                                          Text(
                                            "${controller.data_details[index]['center_service']['Name']}",style: TextStyle(fontWeight: FontWeight.bold),),
                                          Row(children: [
                                            Text(
                                                "${controller.data_details[index]['center_service']['Price']}"),
                                            Text(
                                                " : السعر"),
                                          ],),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              );
                            }),
                      );
                    }),
                      Divider(height: 2,color: Colors.black54,endIndent: 20,indent: 20),
                      SizedBox(height: 16),
                      Text(
                        'شركة التأمين',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: StaticColor.primarycolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            DropdownButton(
                              items: controller.data_company_to_show
                                  .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                                  .toList(),
                              onChanged: (val) {
                                controller
                                    .changedepartment(val as String);
                                controller.type = val;
                                controller.selected = val.toString();
                                // print(controller.selected);
                              },
                              // value: controller.selected,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              hint: Text("${controller.selected}"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'نمط الخصم',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          controller.discount_type = val;
                        },
                        // controller: amountPaidController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'أدخل نمط الخصم',
                          alignLabelWithHint: true, // تحديد محاذاة النص إلى اليمين
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'تفاصيل الخصم',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      TextFormField(
                        onChanged: (val) {
                         controller.discount_details=val;
                        },
                        // controller: amountPaidController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'أدخل تفاصيل الخصم',
                          alignLabelWithHint: true, // تحديد محاذاة النص إلى اليمين
                        ),
                      ),


                      SizedBox(height: 36),
                      GestureDetector(
                        onTap: () {
                          controller.add_bill();
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 50,

                            margin: EdgeInsets.only(left: 20,right: 20, bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff9bb4fd), width: 3),
                              color: Color(0xfff3f3fc),
                              borderRadius: BorderRadius.circular(25),
                            ),

                            child: Center(
                                child: Text(
                                  'حفظ الفاتورة',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black38,
                                  ),
                                )),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),

              ),
            );
        })
      ),
    );
  }
}

