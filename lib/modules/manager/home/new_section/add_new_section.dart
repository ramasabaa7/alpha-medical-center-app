import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/manager/home/home_manager_controller.dart';
import 'package:project_after_update/modules/manager/home/new_section/new_section_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';
class Add_new_section extends StatelessWidget {
  const Add_new_section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    New_section_controller controller =Get.put(New_section_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,
      ),
      body: GetBuilder<New_section_controller>(builder: (controller){
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
                          "إضافة قسم جديد",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/images/receptionist.png"),
                            ),
                            const Text(
                              "قسم الإدارة",
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
                      key: controller.formstate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 3,14,"idpersonal");
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              controller.name=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "اسم القسم",
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
                                  "إضافة",
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
