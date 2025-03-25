import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/financial_home/financial_home_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class financial_home extends StatelessWidget {
  const financial_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    financial_home_controller controller = Get.put(financial_home_controller());
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<financial_home_controller>(builder: (controller) {
        return Container(
          child: ListView(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 300,
                  height: 45,
                  child: TextFormField(
                    validator: (val) {
                      return validinput(val!, 14, 14, "idpersonal");
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.id_patient = value;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: GestureDetector(
                          child: const Icon(Icons.search),
                          onTap: () {
                            controller.checkinput();
                          },
                        ),
                        hintText: "أدخل الرقم الوطني",
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.grey[200]),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed("/Setting_in_finance");
                    },
                    icon: Icon(
                      Icons.settings,
                      size: 50,
                      color: StaticColor.primarycolor,
                    )),
              ],
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 100,
            //     child:   Row(
            //       children: [
            //         Container(
            //           margin: const EdgeInsets.only(top: 10),
            //           padding: const EdgeInsets.symmetric(horizontal: 15),
            //           child: Row(
            //             children: [
            //               Expanded(
            //                 child: TextFormField(
            //                   validator: (val){
            //                     return validinput(val!, 14,14,"idpersonal");
            //                   },
            //                   keyboardType: TextInputType.number,
            //                   onChanged: (value) {
            //                     controller.id_patient=value ;
            //                   },
            //                   decoration: InputDecoration(
            //                       contentPadding: const EdgeInsets.symmetric(vertical: 10),
            //                       prefixIcon: GestureDetector(child: const Icon(Icons.search),onTap: (){
            //                         controller.checkinput();
            //                       },),
            //                       hintText: "أدخل الرقم الوطني",
            //                       hintStyle: const TextStyle(fontSize: 15,color: Colors.grey),
            //                       border: OutlineInputBorder(
            //                           borderSide: BorderSide.none,
            //                           borderRadius: BorderRadius.circular(10)),
            //                       filled: true,
            //                       fillColor: Colors.grey[200]),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 width: 10,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //
            // ),

            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        child:
                            Image.asset("assets/images/finance_employee.png"),
                      ),
                      Text(
                        "المدير المالي",
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 25,
                          color: Color(0xff36414d),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "مركز ألفا الطبي",
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black38),
                  ),
                  Divider(),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.toNamed('/Complete_order');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,

                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Center(
                      child: Text(
                    'طلبات المواد المكتملة',
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
            GestureDetector(
              onTap: () {
                Get.toNamed('/Payments_and_Receipts');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,

                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Center(
                      child: Text(
                    'المدفوعات',
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
            GestureDetector(
              onTap: () {
                Get.toNamed('/Maintenance');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,

                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Center(
                      child: Text(
                    'طلبات الصيانة',
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
            GestureDetector(
              onTap: () {
                Get.toNamed('/financial_material');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,

                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Center(
                      child: Text(
                    'لائحة المواد',
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
            GestureDetector(
              onTap: () {
                Get.toNamed('/Financial_invoices_archive');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                      child: Text(
                    'فواتير المركز',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.black38,
                    ),
                  )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/Insurance_company');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                      child: Text(
                    'شركات التأمين',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.black38,
                    ),
                  )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/Receipts');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9bb4fd), width: 3),
                    color: Color(0xfff3f3fc),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                      child: Text(
                        'الإيصالات',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Colors.black38,
                        ),
                      )),
                ),
              ),
            ),
          ]),
        );
      })),
    );
  }
}
