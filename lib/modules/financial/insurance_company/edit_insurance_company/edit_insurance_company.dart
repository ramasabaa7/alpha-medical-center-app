
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/insurance_company/edit_insurance_company/edit_insurance_company_controller.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/edit_clinics_type_in_managment/edit_clinics_type_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/edit_analysis_type_in_managnent/edit_analysis_type_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/edit_service_type_reception/edit_service_type_rec_controller.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/edit_xray_type_in_managment/edit_xray_type_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Edit_insurance_company extends StatelessWidget {
  const Edit_insurance_company({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Edit_insurance_company_controller controller =Get.put(Edit_insurance_company_controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
        ),
        body: GetBuilder<Edit_insurance_company_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "تعديل معلومات شركة التأمين",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: Image.asset("assets/images/Insurance-pana.png"),
                            ),
                            const Text(
                              "قسم المالية",
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(20),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Form(
                      key: controller.formstate4,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              validator: (val){
                                return validinput(val!, 3,25,"idpersonal");
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                controller.name=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    "اسم شركة التأمين",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.credit_card_outlined),
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
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.IN=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    "IN",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.credit_card_outlined),
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
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.AMB=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    "AMB",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.credit_card_outlined),
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
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.PM=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    "PM",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.credit_card_outlined),
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
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.DV=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    "DV",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.credit_card_outlined),
                                  contentPadding: const EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),

                            SizedBox(height: 20,),
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
                          ],
                        ),
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