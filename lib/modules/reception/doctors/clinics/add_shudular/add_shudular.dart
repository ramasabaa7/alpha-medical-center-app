// import 'package:day_night_time_picker/day_night_time_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:multiselect/multiselect.dart';
// import 'package:project_after_update/core/function/validinput.dart';
// import 'package:project_after_update/modules/reception/doctors/clinics/add_reservation/add_reservation_controller.dart';
// import 'package:project_after_update/modules/reception/doctors/clinics/add_shudular/add_shudular_controller.dart';
// import 'package:project_after_update/static_colors/StaticColors.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:get/get.dart';
//
// class Add_schedular extends StatelessWidget {
//   const Add_schedular({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     TimeOfDay time = TimeOfDay.now();
//     Add_schedular_controller controller =
//     Get.put(Add_schedular_controller());
//     return Scaffold(
//       body: ListView(
//         children: [
//           Form(
//             key: controller.formstate,
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               child:
//               GetBuilder<Add_schedular_controller>(builder: (controller) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       trailing: const Text("أيام العمل"),
//                       subtitle: DropdownButton(
//                         items: controller.options
//                             .map((e) => DropdownMenuItem(
//                           child: Text("$e"),
//                           value: e,
//                         ))
//                             .toList(),
//                         onChanged: (val) {
//                           controller
//                               .changedepartment(val as String);
//                           controller.type = val;
//                           controller.selected = val.toString();
//                           // print(controller.selected);
//                         },
//                         // value: controller.selected,
//                         style: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                         hint: Text("${controller.selected}"),
//                       ),
//                     ),
//                     // TableCalendar(
//                     //   calendarStyle: const CalendarStyle(),
//                     //   rowHeight: 43,
//                     //   headerStyle: const HeaderStyle(
//                     //       formatButtonVisible: false, titleCentered: true),
//                     //   availableGestures: AvailableGestures.all,
//                     //   focusedDay: controller.today,
//                     //   firstDay: DateTime.utc(2023, 4, 1),
//                     //   lastDay: DateTime.utc(2030, 5, 1),
//                     //   selectedDayPredicate: (day) =>
//                     //       isSameDay(day, controller.today),
//                     //   onDaySelected: controller.ondayselected,
//                     // ),
//                     // const SizedBox(
//                     //   height: 20,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //   children: [
//                     //     Container(
//                     //       child: Text(
//                     //           "${controller.today.toString().split(" ")[0]}"),
//                     //     ),
//                     //     const Text(
//                     //       "يوم الحجز",
//                     //       style: TextStyle(
//                     //           fontWeight: FontWeight.bold,
//                     //           color: StaticColor.primarycolor),
//                     //     ),
//                     //   ],
//                     // ),
//                     const Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text("${controller.time1}"),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               showPicker(
//                                 context: context,
//                                 value: Time(hour: 10, minute: 30),
//                                 onChange: controller.ontimechanged,
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             "إختر توقيت البداية",
//                             style: TextStyle(
//                                 color: StaticColor.primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text("${controller.time2}"),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               showPicker(
//                                 context: context,
//                                 value: Time(hour: 10, minute: 30),
//                                 onChange: controller.ontimechanged_two,
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             "إختر توقيت النهاية",
//                             style: TextStyle(
//                                 color: StaticColor.primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(height: 40,),
//                     GestureDetector(
//                       onTap: (){
//                         controller.time1.hour<10 ? controller.hour="0"+"${controller.time1.hour}":controller.hour="${controller.time1.hour}";
//                         controller.time1.minute<10 ? controller.minute="0"+"${controller.time1.minute}":controller.minute="${controller.time1.minute}";
//
//                         controller.time2.hour<10 ? controller.hour_two="0"+"${controller.time2.hour}":controller.hour_two="${controller.time2.hour}";
//                         controller.time2.minute<10 ? controller.minute_two="0"+"${controller.time2.minute}":controller.minute_two="${controller.time2.minute}";
//
//                        // controller.today.day<10 ? controller.day="0"+"${controller.today.day}":controller.day="${controller.today.day}";
//                        // controller.today.month<10 ? controller.month="0"+"${controller.today.month}":controller.month="${controller.today.month}";
//                     //    controller.bookingday="${controller.today.year}"+"/"+"${controller.month}"+"/"+"${controller.day}";
//                         controller.bookingtime="${controller.hour}"+":"+"${controller.minute}";
//                         controller.bookingtime_two="${controller.hour_two}"+":"+"${controller.minute_two}";
//                         controller.add_schudular();
//                       },
//
//                       child: Container(
//                         padding: const EdgeInsets.all(5),
//                         alignment: Alignment.center,
//                         height: 50,
//                         width: MediaQuery.of(context).size.width * 0.3,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: StaticColor.primarycolor,
//                         ),
//                         child: const Text(
//                           "تأكيد",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ),
//
//                     ),
//                   ],
//                 );
//               }
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
