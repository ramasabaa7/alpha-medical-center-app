import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/clinics_section_in_finanical/clinics_section_in_finance_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/display_users_in_reception_controller.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

/////////////////////


class Clinics_section_in_finance extends StatelessWidget {
  const Clinics_section_in_finance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Clinics_section_in_finance_controller controller = Get.put(Clinics_section_in_finance_controller());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/doctor.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: GetBuilder<Clinics_section_in_finance_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            TabBarView(
              children: [

                GetBuilder<Clinics_section_in_finance_controller>(builder: (controller){
                  return
                 //   controller.data[0]['types_of_center_services'].isEmpty?Container(child: Center(child: Text("لا يوجد موظفين لعرضهم",style: TextStyle(color: StaticColor.primarycolor),),),):
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data[0]['types_of_center_services'].length,
                          itemBuilder: (context,int){
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data[0]['types_of_center_services'][int]['user'].length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: ListTile(
                                      title: Text('${controller.data[0]['types_of_center_services'][int]['user'][index]['name']}'),
                                      subtitle: Text('الراتب :200000'),
                                      trailing: Row( // Wrap the IconButton widgets with a Row widget
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0x67e0e0e1),
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit,
                                                color: Color(0xff9bb4fd),
                                                size: 25,
                                              ),
                                              onPressed: () {
                                                Get.defaultDialog(
                                                  title: 'تعديل الراتب',
                                                  content: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 30.0,right: 30),
                                                        child: TextFormField(

                                                          decoration: InputDecoration(labelText: 'الراتب الجديد'),
                                                          keyboardType: TextInputType.number,
                                                          validator: (value) {
                                                            if (value == null || value.isEmpty) {
                                                              return 'رجاء ادخل الراتب الجديد ';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value){
                                                                controller.salary=value;
                                                          },
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
                                                      ),
                                                      child: Text('إلغاء'),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
                                                      ),
                                                      onPressed: () {
                                                        Get.back();
                                                        controller.edit_salary(controller.data[0]['types_of_center_services'][int]['user'][index]['id']);
                                                      },
                                                      child: Text('تعديل الراتب'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),

                                          // Container(
                                          //   height: 40,
                                          //   decoration: BoxDecoration(
                                          //     shape: BoxShape.circle,
                                          //     color: Color(0x67e0e0e1),
                                          //   ),
                                          //   child: IconButton(
                                          //     icon: Icon(
                                          //       Icons.add_box_outlined,
                                          //       color: Color(0xff9bb4fd),
                                          //       size: 25,
                                          //     ),
                                          //     onPressed: () {
                                          //       Get.defaultDialog(
                                          //         title: 'طلب زيادة',
                                          //         content: Column(
                                          //           children: [
                                          //             Padding(
                                          //               padding: const EdgeInsets.only(left: 30.0,right: 30),
                                          //               child: TextFormField(
                                          //
                                          //                 decoration: InputDecoration(labelText: 'نسبة الزيادة'),
                                          //                 keyboardType: TextInputType.number,
                                          //                 validator: (value) {
                                          //                   if (value == null || value.isEmpty) {
                                          //                     return 'رجاء ادخل النسبة ';
                                          //                   }
                                          //                   return null;
                                          //                 },
                                          //                 onSaved: (value) {
                                          //                   final newSalary = double.tryParse(value!);
                                          //                   if (newSalary != null) {
                                          //                     // employee.salary = newSalary;
                                          //                   }
                                          //                 },
                                          //               ),
                                          //             ),
                                          //             Padding(
                                          //               padding: const EdgeInsets.only(left: 30.0,right: 30),
                                          //               child: TextFormField(
                                          //                 decoration: InputDecoration(labelText: 'ملاحظة'),
                                          //                 maxLines: 3,
                                          //               ),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //         actions: [
                                          //           ElevatedButton(
                                          //             onPressed: () {
                                          //               Get.back();
                                          //             },
                                          //             style: ButtonStyle(
                                          //               backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
                                          //             ),
                                          //             child: Text('إلغاء'),
                                          //           ),
                                          //           ElevatedButton(
                                          //             style: ButtonStyle(
                                          //               backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
                                          //             ),
                                          //             onPressed: () {
                                          //               // Implement salary increase request logic here
                                          //               // You can access the entered values using the employee instance
                                          //               Get.back();
                                          //             },
                                          //             child: Text('إرسال الطلب'),
                                          //           ),
                                          //         ],
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    );
                }),

              ],
            );
        }),
      ),
    );
  }
}
