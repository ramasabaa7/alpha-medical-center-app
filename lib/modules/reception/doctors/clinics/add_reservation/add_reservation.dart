import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class Add_reservation extends StatelessWidget {
  const Add_reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay time = TimeOfDay.now();
    Add_reservation_controller controller =
        Get.put(Add_reservation_controller());
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: controller.formstate,
            child: Container(
              padding: const EdgeInsets.all(10),
              child:
                  GetBuilder<Add_reservation_controller>(builder: (controller) {
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
                        Text("${controller.time1}"),
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
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            validator: (val){
                              return validinput(val!, 14,14,"idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.id_personal=value;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                prefixIcon: const Icon(Icons.person_2_outlined),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                        ),
                        SizedBox(width: 10,),
                        const Expanded(
                          child: Text(
                            "الرقم الوطني",
                            style: TextStyle(
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 50,),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        controller.time1.hour<10 ? controller.hour="0"+"${controller.time1.hour}":controller.hour="${controller.time1.hour}";
                        controller.time1.minute<10 ? controller.minute="0"+"${controller.time1.minute}":controller.minute="${controller.time1.minute}";
                        controller.today.day<10 ? controller.day="0"+"${controller.today.day}":controller.day="${controller.today.day}";
                        controller.today.month<10 ? controller.month="0"+"${controller.today.month}":controller.month="${controller.today.month}";
                        controller.bookingday="${controller.today.year}"+"/"+"${controller.month}"+"/"+"${controller.day}";
                        controller.bookingtime="${controller.hour}"+":"+"${controller.minute}";
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
