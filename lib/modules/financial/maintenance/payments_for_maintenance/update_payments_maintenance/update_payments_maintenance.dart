import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/insurance_company/add_insurance_company/add_insurance_company_controller.dart';
import 'package:project_after_update/modules/financial/maintenance/add_maintenance_request/add_maintenance_request_controller.dart';
import 'package:project_after_update/modules/financial/maintenance/edit_maintenance_request/edit_maintenance_request_controller.dart';
import 'package:project_after_update/modules/financial/maintenance/payments_for_maintenance/update_payments_maintenance/update_payments_maintenance_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/add_service_type_for_reception/add_serive_type_rec_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class update_payments_maintenance extends StatelessWidget {
  const update_payments_maintenance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    update_payments_maintenance_controller controller =
    Get.put<update_payments_maintenance_controller>(update_payments_maintenance_controller());
    return Scaffold(
        body: GetBuilder<update_payments_maintenance_controller>(builder: (controller){
          return
            Container(
              child: ListView(
                children: [
                  Container(
                    height: 115,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: StaticColor.primarycolor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //   margin: EdgeInsets.only(left: 10),
                          //  height:100,
                          // width: 100,
                          child: Image.asset(
                            "assets/images/export.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: const [
                              Text(
                                "مركز ألفا الطبي",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "جميع الإختصاصات الطبية",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "عيادات - مخبر - أشعة",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            " تعديل معلومات المدفوعات",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.black45,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 3,100,"idpersonal");
                            },
                            onChanged: (val) {
                              controller.name=val;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label: const Text(
                                  "الاسم",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: Icon(Icons.info_outline,size: 30,),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 1,25,"idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.price=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "السعر",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: const Icon(Icons.monetization_on_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 1,25,"idpersonal");
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              controller.details=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "التفاصيل",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: const Icon(Icons.edit),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),

                          Divider(),
                          SizedBox(height: 10,),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                controller.checkinput();

                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: StaticColor.primarycolor,
                                ),
                                child: const Text(
                                  "تعديل",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        })
    );
  }
}
