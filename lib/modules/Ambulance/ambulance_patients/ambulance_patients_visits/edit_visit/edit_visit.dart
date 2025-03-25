

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_details/ambulance_visit_registration/ambulance_visit_registration_controller.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/edit_visit/edit_visit_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Edit_visit extends StatelessWidget {
  const Edit_visit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Edit_visit_controller controller =Get.put(Edit_visit_controller());
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<Edit_visit_controller>(builder: (controller) {
            return
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
                            "قسم الإسعاف",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 60,
                                child: Image.asset("assets/images/health-insurance.png"),
                              ),
                              const Text(
                                "تعديل زيارة",
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
                    ), Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(20),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Form(
                        key: controller.formstate3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              validator: (val){
                                return validinput(val!, 3,14,"name");
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                controller.referringphysician=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    " الطبيب المراجع ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.person),
                                  contentPadding: const EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              validator: (val){
                                return validinput(val!, 3,14,"name");
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                controller.title=value ;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label:  const Text(
                                    "اسم المريض",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.person_pin),
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
      ),
    );
  }
}