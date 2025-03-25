import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/modules/reception/laboratory_in_reception/laboratory_reserv/laboratory_reserv_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:table_calendar/table_calendar.dart';

class Laboratory_reserv extends StatelessWidget {
  const Laboratory_reserv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay time = TimeOfDay.now();
    Laboratory_reserv_controller controller =
        Get.put(Laboratory_reserv_controller());
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child:
                GetBuilder<Laboratory_reserv_controller>(builder: (controller) {
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
                      Text("${controller.time1.toString()}"),
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
                  ListTile(
                    trailing: const Text(
                      "التحليل",
                      style: TextStyle(
                          color: StaticColor.primarycolor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: DropDownMultiSelect(
                      options: controller.center_services,
                      whenEmpty: "إختر التحليل",
                      onChanged: (value) {
                        controller.selectedoptionlist_centerservices.value =
                            value;
                        controller.selectedoption_centerservices.value = "";
                        controller.selectedoptionlist_centerservices.value
                            .forEach((element) {
                          controller.selectedoption_centerservices.value =
                              controller.selectedoption_centerservices.value +
                                  " " +
                                  element;
                        });
                      },
                      selectedValues:
                          controller.selectedoptionlist_centerservices.value,
                    ),
                  ),
                  Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "معلومات المريض",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon: const Icon(Icons.person_2_outlined),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "اسم المريض",
                          style: TextStyle(
                              color: StaticColor.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon: const Icon(Icons.phone),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "رقم الهاتف",
                          style: TextStyle(
                              color: StaticColor.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "تسديد الملغ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon:
                                  const Icon(Icons.monetization_on_outlined),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "المدفوع",
                          style: TextStyle(
                              color: StaticColor.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon:
                                  const Icon(Icons.attach_money_outlined),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "المتبق",
                          style: TextStyle(
                              color: StaticColor.primarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
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
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
