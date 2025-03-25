
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/manager/home/ambulance_in_managment/edit_service_type_ambulance/edit_service_type_ambulance_controller.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/edit_clinics_type_in_managment/edit_clinics_type_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/edit_analysis_type_in_managnent/edit_analysis_type_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/edit_service_type_reception/edit_service_type_rec_controller.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/edit_xray_type_in_managment/edit_xray_type_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Edit_service_type_ambulance extends StatelessWidget {
  const Edit_service_type_ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Edit_service_type_ambulance_controller controller =Get.put(Edit_service_type_ambulance_controller());
    return Scaffold(
        body: GetBuilder<Edit_service_type_ambulance_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: "البحث",
                                  hintStyle: const TextStyle(fontSize: 20),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: StaticColor.primarycolor,
                          ),
                          width: 60,
                          height: 55,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_active_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "قسم الإدارة",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/images/patient.png"),
                            ),
                            const Text(
                              "تعديل نوع الخدمة/ قسم الإستقبال",
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          color: Colors.black45,
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(20),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Form(
                      key: controller.formstate4,
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
                                  "نوع الخدمة",
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

                ],
              ),
            );
        })
    );
  }
}