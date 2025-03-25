import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/add_clinics/add_type_clinics_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/add_analysis/add_analysis_type_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Add_analysis extends StatelessWidget {
  const Add_analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Add_analysis_type_controller controller =
    Get.put<Add_analysis_type_controller>(Add_analysis_type_controller());
    return Scaffold(
      body: GetBuilder<Add_analysis_type_controller>(builder: (controller){
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
                  key: controller.formstate,
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
                          " إضافة نوع تحليل جديد",
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
                            return validinput(val!, 3,100,"idpersonal");
                          },
                          onChanged: (val) {
                            controller.name=val;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              label: const Text(
                                "اسم التحليل",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: StaticColor.primarycolor,
                                    fontWeight: FontWeight.bold),
                              ),
                              suffixIcon: Icon(Icons.filter_list_alt,size: 30,),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        Divider(),
                        // TextFormField(
                        //   onChanged: (val) {},
                        //   decoration: InputDecoration(
                        //       floatingLabelBehavior: FloatingLabelBehavior.always,
                        //       label: const Text(
                        //         "السعر",
                        //         style: TextStyle(
                        //             fontSize: 20,
                        //             color: StaticColor.primarycolor,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //       suffixIcon: Icon(Icons.attach_money_outlined,size: 30,),
                        //       contentPadding: const EdgeInsets.all(10),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(20),
                        //       )),
                        // ),
                     //   Divider(),
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
