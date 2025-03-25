import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/add_clinics_services/add_clinics_servic_controller.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/edit_clinics_services/edit_clinics_service_controller.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/edit_laboratory_service/edit_laboratory_service_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Edit_laboratory_service extends StatelessWidget {
  const Edit_laboratory_service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Edit_laboratory_services_controller controller =
    Get.put<Edit_laboratory_services_controller>(Edit_laboratory_services_controller());
    return Scaffold(
        body: GetBuilder<Edit_laboratory_services_controller>(builder: (controller){
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
                            "assets/images/logo.jpg",
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
                                "إسعاف - مخبر - أشعة",
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
                    key:  controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "قسم الإدارة",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            " إضافة خدمة جديدة",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
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
                              return validinput(val!, 3,14,"idpersonal");
                            },
                            onChanged: (val) {
                              controller.name=val;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label: const Text(
                                  "الخدمة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: Icon(Icons.add_circle,size: 30,color: StaticColor.primarycolor,),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          Divider(),
                          Container(
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
                                        Text("الحالة ",style: TextStyle(color: StaticColor.primarycolor,fontWeight: FontWeight.bold),),
                                        SizedBox(width: 5,),
                                        Icon(Icons.medical_services_outlined,
                                            color: StaticColor.primarycolor),

                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Divider(),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 3,50,"idpersonal");
                            },
                            onChanged: (val) {
                              controller.details=val;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label: const Text(
                                  "التفاصيل",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: Icon(Icons.info_outline,size: 30,color: StaticColor.primarycolor,),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          Divider(),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 3,14,"idpersonal");
                            },
                            onChanged: (val) {
                              controller.price=val;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label: const Text(
                                  "السعر",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: Icon(Icons.attach_money_outlined,size: 30,color: StaticColor.primarycolor,),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
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
                                  "تأكيد",
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
