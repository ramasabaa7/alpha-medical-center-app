import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_controller.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/reservations/edit_reservation/edit_reservation_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class Edit_reservation extends StatelessWidget {
  const Edit_reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay time = TimeOfDay.now();
    Edit_reservation_controller controller =
    Get.put(Edit_reservation_controller());
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: controller.formstate,
            child: Container(
              padding: const EdgeInsets.all(10),
              child:
              GetBuilder<Edit_reservation_controller>(builder: (controller) {
                return Column(
                  children: [
                    TableCalendar(
                      calendarStyle: const CalendarStyle(),
                      rowHeight: 43,
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      availableGestures: AvailableGestures.all,
                      focusedDay: controller.today_edit,
                      firstDay: DateTime.utc(2023, 4, 1),
                      lastDay: DateTime.utc(2030, 5, 1),
                      selectedDayPredicate: (day) =>
                          isSameDay(day, controller.today_edit),
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
                              "${controller.today_edit.toString().split(" ")[0]}"),
                        ),
                        const Text(
                          "يوم الحجز",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: StaticColor.primarycolor),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${controller.time1_edit}"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: Time(hour: 10, minute: 30),
                                onChange: controller.ontimechanged,
                              ),
                            );
                          },
                          child: const Text(
                            "إختر توقيت الحجز",
                            style: TextStyle(
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 3,
                    //       child: TextFormField(
                    //         validator: (val){
                    //           return validinput(val!, 14,14,"idpersonal");
                    //         },
                    //         keyboardType: TextInputType.number,
                    //         onChanged: (value) {
                    //           controller.id_personal=value;
                    //         },
                    //         decoration: InputDecoration(
                    //             floatingLabelBehavior: FloatingLabelBehavior.always,
                    //             prefixIcon: const Icon(Icons.person_2_outlined),
                    //             contentPadding: const EdgeInsets.all(10),
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(20),
                    //             )),
                    //       ),
                    //     ),
                    //     SizedBox(width: 10,),
                    //     const Expanded(
                    //       child: Text(
                    //         "الرقم الوطني",
                    //         style: TextStyle(
                    //             color: StaticColor.primarycolor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Divider(height: 50,),
                    //SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        controller.time1_edit.hour<10 ? controller.hour_edit="0"+"${controller.time1_edit.hour}":controller.hour_edit="${controller.time1_edit.hour}";
                        controller.time1_edit.minute<10 ? controller.minute_edit="0"+"${controller.time1_edit.minute}":controller.minute_edit="${controller.time1_edit.minute}";
                        controller.today_edit.day<10 ? controller.day_edit="0"+"${controller.today_edit.day}":controller.day_edit="${controller.today_edit.day}";
                        controller.today_edit.month<10 ? controller.month_edit="0"+"${controller.today_edit.month}":controller.month_edit="${controller.today_edit.month}";
                        controller.bookingday_edit="${controller.today_edit.year}"+"/"+"${controller.month_edit}"+"/"+"${controller.day_edit}";
                        controller.bookingtime_edit="${controller.hour_edit}"+":"+"${controller.minute_edit}";
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
    );
  }
}
