import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/add_record/add_record_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Add_record extends StatelessWidget {
  const Add_record({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Patient_Regesteration_controller controller =Get.put(Patient_Regesteration_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,
      ),
      body: Container(
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     Container(
                       height: 50,
                       width: 50,
                       child: Image.asset("assets/images/document.png"),
                     ),
                     const Text(
                       "إضافة سجل طبي جديد",
                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                     ),

                   ],),
                    const Text(
                      "يرجى إدخال معلومات المريض",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      // validator: (val){
                      // return  validinput(val!, 3, 20,"username");
                      // },
                      keyboardType: TextInputType.name,
                      onChanged: (val) {
                        controller.fullname=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            " اسم المريض",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.person_2_outlined),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      validator: (val){
                       return validinput(val!, 14,14,"idpersonal");
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        controller.idpersonal=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            " الرقم الوطني ",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.credit_card_outlined),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (val){
                       return validinput(val!,1,3,"age");
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        controller.age=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            " العمر ",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.man),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (val){
                       return validinput(val!, 10, 10,"phone");
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        controller.phonenumber=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            " رقم الهاتف ",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.phone),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (val){
                       return validinput(val!, 4, 20,"addres");
                      },
                      keyboardType: TextInputType.multiline,
                      onChanged: (val) {
                        controller.addres=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            "العنوان  ",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.location_on_outlined),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20,),
                    GetBuilder<Patient_Regesteration_controller>(builder: (controller) {
                      return Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: StaticColor.thirdgrey.withAlpha(20),
                            borderRadius: BorderRadius.circular(20),
                            border: Border(
                              top: BorderSide(
                                  width: 1, color: Colors.black.withAlpha(80)),
                              right: BorderSide(
                                  width: 1, color: Colors.black.withAlpha(80)),
                              left: BorderSide(
                                  width: 1, color: Colors.black.withAlpha(80)),
                              bottom: BorderSide(
                                  width: 1, color: Colors.black.withAlpha(80)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton(
                                items: controller.department
                                    .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                                    .toList(),
                                onChanged: (val) {
                                  controller.changedepartment(val!);
                                  print(controller.selected);
                                },
                                value: controller.selected,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: StaticColor.blackcolor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                child: Row(
                                  children: const [
                                    Text("الحالة الإسعافية",style: TextStyle(color: StaticColor.primarycolor,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.medical_services_outlined,
                                        color: StaticColor.blackcolor),

                                  ],
                                ),
                              ),
                            ],
                          ));
                    }),
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
                            "إضافة",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
