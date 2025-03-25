import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/customer/manager/customer_show_employee/customer_show_employee.dart';
import 'package:project_after_update/customer/manager/customer_show_employee/tabs.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Employee extends StatelessWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
             Tabs(image_bath: "assets/images/ray_doctor.png"),
            Tabs(image_bath: "assets/images/laboratory_doctor.png"),
            Tabs(image_bath: "assets/images/receptionist.png"),
            Tabs(image_bath: "assets/images/ambulance_emb.png"),
            Tabs(image_bath: "assets/images/storage_emb.png"),
           Tabs(image_bath: "assets/images/finance_employee.png"),
            ],
          ),
        ),
        body: TabBarView(children: [
          Customer_show_employee(dep_name: "قسم الأشعة"),
          Customer_show_employee(dep_name: "قسم المخبر"),
          Customer_show_employee(dep_name: "قسم الإستقبال"),
          Customer_show_employee(dep_name: "قسم الاسعاف"),
          Customer_show_employee(dep_name: "قسم المخزن"),
          Customer_show_employee(dep_name: "قسم المالية"),
        ]),
      ),
    );
  }
}
