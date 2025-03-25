import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/accept_item_request/accept_item_request_controller.dart';
import 'package:project_after_update/modules/financial/orders_from_warehouse/orders_from_warehouse_controller.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class Accept_item_request extends StatelessWidget {
  const Accept_item_request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay time = TimeOfDay.now();
    Accept_item_request_controller controller =
    Get.put(Accept_item_request_controller());
    Order_from_warehouse_controller controller2 =Get.put(Order_from_warehouse_controller());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*0.9,
        child: ListView(
          children: [
            Form(
              key: controller.formstate,
              child: Container(
                padding: const EdgeInsets.all(10),
                child:
                GetBuilder<Accept_item_request_controller>(builder: (controller) {
                  return Column(
                    children: [
                      TableCalendar(
                        calendarStyle: const CalendarStyle(),
                        rowHeight: 43,
                        headerStyle: const HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
                        availableGestures: AvailableGestures.all,
                        focusedDay: controller.today,
                        firstDay: DateTime.utc(2023, 4, 1),
                        lastDay: DateTime.utc(2030, 5, 1),
                        selectedDayPredicate: (day) =>
                            isSameDay(day, controller.today),
                        onDaySelected: controller.ondayselected,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                                "${controller.today.toString().split(" ")[0]}"),
                          ),
                          const Text(
                            "تاريخ الإنتاج",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: StaticColor.primarycolor),
                          ),
                        ],
                      ),
                      const Divider(),
                      TableCalendar(
                        calendarStyle: const CalendarStyle(),
                        rowHeight: 43,
                        headerStyle: const HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
                        availableGestures: AvailableGestures.all,
                        focusedDay: controller.today1,
                        firstDay: DateTime.utc(2023, 4, 1),
                        lastDay: DateTime.utc(2030, 5, 1),
                        selectedDayPredicate: (day) =>
                            isSameDay(day, controller.today1),
                        onDaySelected: controller.ondayselected1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                                "${controller.today1.toString().split(" ")[0]}"),
                          ),
                          const Text(
                            "تاريخ انتهاء الصلاحية",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: StaticColor.primarycolor),
                          ),
                        ],
                      ),
                      Divider(),
                      TableCalendar(
                        calendarStyle: const CalendarStyle(),
                        rowHeight: 43,
                        headerStyle: const HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
                        availableGestures: AvailableGestures.all,
                        focusedDay: controller.today2,
                        firstDay: DateTime.utc(2023, 4, 1),
                        lastDay: DateTime.utc(2030, 5, 1),
                        selectedDayPredicate: (day) =>
                            isSameDay(day, controller.today2),
                        onDaySelected: controller.ondayselected2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                                "${controller.today2.toString().split(" ")[0]}"),
                          ),
                          const Text(
                            "تاريخ الإنشاء ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: StaticColor.primarycolor),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: (){

                          controller.today.day<10 ? controller.day="0"+"${controller.today.day}":controller.day="${controller.today.day}";
                          controller.today.month<10 ? controller.month="0"+"${controller.today.month}":controller.month="${controller.today.month}";
                          controller.production="${controller.today.year}"+"/"+"${controller.month}"+"/"+"${controller.day}";

                          controller.today1.day<10 ? controller.day1="0"+"${controller.today1.day}":controller.day1="${controller.today1.day}";
                          controller.today1.month<10 ? controller.month1="0"+"${controller.today1.month}":controller.month1="${controller.today1.month}";
                          controller.expiry="${controller.today1.year}"+"/"+"${controller.month1}"+"/"+"${controller.day1}";


                          controller.today2.day<10 ? controller.day2="0"+"${controller.today2.day}":controller.day2="${controller.today2.day}";
                          controller.today2.month<10 ? controller.month2="0"+"${controller.today2.month}":controller.month2="${controller.today2.month}";
                          controller.create="${controller.today2.year}"+"-"+"${controller.month2}"+"-"+"${controller.day2}";

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
                    ],
                  );
                }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
