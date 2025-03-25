import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/financial/financial_employees_salary/financial_employees_salary_controller.dart';
import 'package:project_after_update/modules/manager/home/home_manager_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Finanical_employee_salary extends StatelessWidget {
  const Finanical_employee_salary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Finanical_employees_salary_controller controller =
        Get.put(Finanical_employees_salary_controller());

    return RefreshIndicator(
      onRefresh: () async {
        await controller.get_all_section();
      },
      child: Scaffold(
        body: SafeArea(child: GetBuilder<Finanical_employees_salary_controller>(
            builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: StaticColor.primarycolor,
                  ),
                )
              : Container(
                  child: ListView(
                    children: [
                      // Container(
                      //   margin: const EdgeInsets.only(top: 10),
                      //   padding: const EdgeInsets.symmetric(horizontal: 15),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //           child: TextFormField(
                      //         decoration: InputDecoration(
                      //             contentPadding:
                      //                 const EdgeInsets.symmetric(vertical: 10),
                      //             prefixIcon: const Icon(Icons.search),
                      //             hintText: "البحث",
                      //             hintStyle: const TextStyle(fontSize: 20),
                      //             border: OutlineInputBorder(
                      //                 borderSide: BorderSide.none,
                      //                 borderRadius: BorderRadius.circular(10)),
                      //             filled: true,
                      //             fillColor: Colors.grey[200]),
                      //       )),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                       const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "قسم المالية ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              color: StaticColor.primarycolor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 100,
                                    child: Image.asset(
                                      "assets/images/logo.jpg"
                                      "",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: const Text(
                                      " مركز ألفا الطبي",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              color: Colors.black45,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: GridView.builder(
                                itemCount: controller.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (controller.data[index]['Name'] ==
                                          'clinic') {
                                        Get.toNamed(
                                            "/Clinics_section_in_finance",
                                            arguments: {
                                              "id_section":
                                                  controller.data[index]['id']
                                            });
                                      } else if (controller.data[index]
                                              ['Name'] ==
                                          'xray') {
                                        Get.toNamed("/Xray_section_in_finance",
                                            arguments: {
                                              "id_section":
                                                  controller.data[index]['id']
                                            });
                                      } else if (controller.data[index]
                                              ['Name'] ==
                                          'Laboratory') {
                                        Get.toNamed("/Laboratory_section_in_finance",
                                            arguments: {
                                              "id_section":
                                                  controller.data[index]['id']
                                            });
                                      } else if (controller.data[index]
                                              ['Name'] ==
                                          'Store') {
                                        Get.toNamed("/Store_section_in_finance",arguments: {
                                          "id_section":
                                          controller.data[index]['id']
                                        });
                                      } else if (controller.data[index]
                                              ['Name'] ==
                                          'Ambulance') {
                                        Get.toNamed("/Ambulance_in_managment",
                                            arguments: {
                                              "id_section":
                                                  controller.data[index]['id']
                                            });
                                      } else if (controller.data[index]
                                              ['Name'] ==
                                          'Reception') {
                                        Get.toNamed("/Reception_section_in_finance",
                                            arguments: {
                                              "id_section":
                                                  controller.data[index]['id']
                                            });
                                      } else if (controller.data[index]
                                              ['Name'] ==
                                          'Finance') {
                                        Get.toNamed("/Finance_section_in_finance",
                                            arguments: {
                                              "id_section":
                                                  controller.data[index]['id']
                                            });
                                      }
                                    },
                                    child: Container(
                                        // height: MediaQuery.of(context).size.height * 0.3,
                                        // width: MediaQuery.of(context).size.width * 0.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: StaticColor.primarycolor,
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: controller.data[index]
                                                          ['Name'] ==
                                                      'clinic'
                                                  ? Image.asset(
                                                      "assets/images/Body anatomy-rafiki.png",
                                                      fit: BoxFit.fill)
                                                  : controller.data[index]
                                                              ['Name'] ==
                                                          'xray'
                                                      ? Image.asset(
                                                          "assets/images/Rheumatology-pana.png",
                                                          fit: BoxFit.fill)
                                                      : controller.data[index]
                                                                  ['Name'] ==
                                                              'Laboratory'
                                                          ? Image.asset(
                                                              "assets/images/Laboratory-bro.png",
                                                              fit: BoxFit.fill)
                                                          : controller.data[index]['Name'] ==
                                                                  'Store'
                                                              ? Image.asset(
                                                                  "assets/images/storage.png",
                                                                  fit: BoxFit.fill)
                                                              : controller.data[index]['Name'] == 'Reception'
                                                                  ? Image.asset("assets/images/reception.png", fit: BoxFit.fill)
                                                                  : controller.data[index]['Name'] == 'Finance'
                                                                      ? Image.asset("assets/images/finance.png", fit: BoxFit.fill)
                                                                      : controller.data[index]['Name'] == 'Ambulance'
                                                                          ? Image.asset("assets/images/Ambulance-section.png", fit: BoxFit.fill)
                                                                          : Image.asset("assets/images/logo.png", fit: BoxFit.fill),
                                            ),
                                            Expanded(
                                              child: controller.data[index]
                                                          ['Name'] ==
                                                      'clinic'
                                                  ? Text(
                                                      "العيادات",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    )
                                                  : controller.data[index]
                                                              ['Name'] ==
                                                          'xray'
                                                      ? Text(
                                                          "الأشعة",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15),
                                                        )
                                                      : controller.data[index]
                                                                  ['Name'] ==
                                                              'Laboratory'
                                                          ? Text(
                                                              "المخبر",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                            )
                                                          : controller.data[index]
                                                                      [
                                                                      'Name'] ==
                                                                  'Store'
                                                              ? Text(
                                                                  "المخزن",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15),
                                                                )
                                                              : controller.data[index]['Name'] ==
                                                                      'Reception'
                                                                  ? Text(
                                                                      "الإستقبال",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              15),
                                                                    )
                                                                  : controller.data[index]['Name'] ==
                                                                          'Finance'
                                                                      ? Text(
                                                                          "المالية",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 15),
                                                                        )
                                                                      : controller.data[index]['Name'] ==
                                                                              'Ambulance'
                                                                          ? Text(
                                                                              "الإسعاف",
                                                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                                                            )
                                                                          : Text(
                                                                              "${controller.data[index]['Name']}",
                                                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                                                            ),
                                            )
                                          ],
                                        )),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        })),
      ),
    );
  }
}

//
// Widget _buildEmployeeList() {
//     return ListView.builder(
//       itemCount: 14,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('راما سبعة'),
//           subtitle: Text('الراتب :200000'),
//           trailing: Row( // Wrap the IconButton widgets with a Row widget
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0x67e0e0e1),
//                 ),
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.edit,
//                     color: Color(0xff9bb4fd),
//                     size: 25,
//                   ),
//                   onPressed: () {
//                     _editSalaryDialog();
//                   },
//                 ),
//               ),
//
//               Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0x67e0e0e1),
//                 ),
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.add_box_outlined,
//                     color: Color(0xff9bb4fd),
//                     size: 25,
//                   ),
//                   onPressed: () {
//                     _increment_requrst_SalaryDialog();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//
// void _editSalaryDialog() {
//   Get.defaultDialog(
//     title: 'تعديل الراتب',
//     content: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 30.0,right: 30),
//           child: TextFormField(
//
//             decoration: InputDecoration(labelText: 'الراتب الجديد'),
//             keyboardType: TextInputType.number,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'رجاء ادخل الراتب الجديد ';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               final newSalary = double.tryParse(value!);
//               if (newSalary != null) {
//                 // employee.salary = newSalary;
//               }
//             },
//           ),
//         ),
//
//       ],
//     ),
//     actions: [
//       ElevatedButton(
//         onPressed: () {
//           Get.back();
//         },
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
//         ),
//         child: Text('إلغاء'),
//       ),
//       ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
//         ),
//         onPressed: () {
//           // Implement salary increase request logic here
//           // You can access the entered values using the employee instance
//           Get.back();
//         },
//         child: Text('تعديل الراتب'),
//       ),
//     ],
//   );
// }
// void _increment_requrst_SalaryDialog() {
//   Get.defaultDialog(
//     title: 'طلب زيادة',
//     content: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 30.0,right: 30),
//           child: TextFormField(
//
//             decoration: InputDecoration(labelText: 'نسبة الزيادة'),
//             keyboardType: TextInputType.number,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'رجاء ادخل النسبة ';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               final newSalary = double.tryParse(value!);
//               if (newSalary != null) {
//                 // employee.salary = newSalary;
//               }
//             },
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 30.0,right: 30),
//           child: TextFormField(
//             decoration: InputDecoration(labelText: 'ملاحظة'),
//             maxLines: 3,
//           ),
//         ),
//       ],
//     ),
//     actions: [
//       ElevatedButton(
//         onPressed: () {
//           Get.back();
//         },
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
//         ),
//         child: Text('إلغاء'),
//       ),
//       ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
//         ),
//         onPressed: () {
//           // Implement salary increase request logic here
//           // You can access the entered values using the employee instance
//           Get.back();
//         },
//         child: Text('إرسال الطلب'),
//       ),
//     ],
//   );
// }
