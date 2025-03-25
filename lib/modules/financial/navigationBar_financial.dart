import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_after_update/modules/financial/financial_employees_salary/financial_employees_salary.dart';
import 'package:project_after_update/modules/financial/financial_home/financial_home.dart';
import 'package:project_after_update/modules/financial/navigationBar_financial_controller.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/waiting_from_reception.dart';
class navigationBar_financial extends StatelessWidget {
  navigationBar_financial({Key? key}) : super(key: key);

  navigationBar_financial_controller bottomNavigationController =
  Get.put(navigationBar_financial_controller());

  final screens = [
    financial_home(),
    waiting_from_reception(),
    Finanical_employee_salary(),
    orders_from_warehouse(),
    // addConsumerNurse()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: bottomNavigationController.selectedIndex.value,
        children: screens,
      )),
      bottomNavigationBar: FancyBottomBar(
        items: [
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "المنزل",
            icon: Icon(Icons.home,color: Color(0xff9bb4fd)),
          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "القوائم",
            icon: Icon(Icons.payments_outlined,color: Color(0xff9bb4fd)),

          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "الموظفين",
            icon: Icon(Icons.person,color: Color(0xff9bb4fd)),

          ),
          FancyItem(
            textColor: Color(0xff9bb4fd),
            title: "الطلبات",
            icon: Icon(Icons.read_more_outlined,color: Color(0xff9bb4fd)),

          ),
        ],
        type: FancyType.FancyV2,
        onItemSelected: (index) {
          bottomNavigationController.changeIndex(index);
        },
        selectedIndex: bottomNavigationController.selectedIndex.value,
      ),
    );
  }
}