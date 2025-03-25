import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/visit_ergisteration/visit_register_in_reception_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Reception_visit_registration extends StatelessWidget {
  const Reception_visit_registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Reception_visit_registration_controller controller =Get.put(Reception_visit_registration_controller());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
        ),
          body: GetBuilder<Reception_visit_registration_controller>(builder: (controller) {
            return
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
                            "تسجيل زيارة",
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
                                "قسم الإستقبال",
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
                        key: controller.formstate,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              // validator: (val){
                              //   return validinput(val!, 2,14,"idpersonal");
                              // },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                controller.referingdoctor=value ;
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
                                    "تسجيل",
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