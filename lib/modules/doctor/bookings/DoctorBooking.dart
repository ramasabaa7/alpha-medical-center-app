import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/doctor/bookings/CalendarController.dart';

class DoctorBooking extends StatefulWidget {
  @override
  _DoctorBookingState createState() => _DoctorBookingState();
}

class _DoctorBookingState extends State<DoctorBooking> {

  late DateTime selectedDay = DateTime.now();
  late List <CleanCalendarEvent> selectedEvent;
  DoctorBookingController controller =Get.find();

  // final Map<DateTime,List<CleanCalendarEvent>> events = {
  //
  //   DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
  //   [
  //     CleanCalendarEvent('Event A',
  //         startTime: DateTime(
  //             DateTime.now().year,DateTime.now().month,DateTime.now().day,10,0),
  //         endTime:  DateTime(
  //             DateTime.now().year,DateTime.now().month,DateTime.now().day,12,0),
  //         description: 'A special event',
  //         color: CupertinoColors.systemGreen),
  //   ],
  //   DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
  //   [
  //     CleanCalendarEvent('Event F',
  //         startTime: DateTime(
  //             DateTime.now().year,DateTime.now().month,DateTime.now().day,5,0),
  //         endTime:  DateTime(
  //             DateTime.now().year,DateTime.now().month,DateTime.now().day,1,0),
  //         description: 'F special event',
  //         color: CupertinoColors.systemGreen),
  //   ],
  //
  //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
  //   [
  //     CleanCalendarEvent('Event B',
  //         startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 10, 0),
  //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 12, 0),
  //         color: Colors.orange),
  //     CleanCalendarEvent('Event C',
  //         startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 14, 30),
  //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 17, 0),
  //         color: Colors.pink),
  //   ],
  // };
  //

  Map<String, String> monthNames = {
    'January': 'يناير',
    'February': 'فبراير',
    'March': 'مارس',
    'April': 'أبريل',
    'May': 'مايو',
    'June': 'يونيو',
    'July': 'يوليو',
    'August': 'أغسطس',
    'September': 'سبتمبر',
    'October': 'أكتوبر',
    'November': 'نوفمبر',
    'December': 'ديسمبر'
  };
  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = controller.events[selectedDay] ?? [];
    });
    print(selectedDay);
  }
  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = controller.events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9bb4fd),
        title: Text('جدول المواعيد '),
        centerTitle: true,
      ),
      body:  SafeArea(

        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Expanded(
                child:

                Calendar(

                  startOnMonday: true,
                  selectedColor: Color(0xff9bb4fd),
                  todayColor: Color(0xff9bb4fd),
                  eventColor:  Color(0xff3856ad),
                  eventDoneColor: Colors.amber,
                  bottomBarColor:  Color(0xff3856ad),

                  onRangeSelected: (range) {
                    print('selected Day ${range.from},${range.to}');
                  },

                  onDateSelected: (date){
                    return _handleData(date);
                  },
                  events: controller.events,
                  isExpanded: true,
                  dayOfWeekStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black12,
                    fontWeight: FontWeight.w100,
                  ),
                  bottomBarTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hideBottomBar: false,
                  hideArrows: false,
                  weekDays: ['الإثنين','الثلاثاء','الأربعاء','الخميس','الجمعة','السبت','الأحد'],


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class DoctorBooking extends StatefulWidget {
//   const DoctorBooking({Key? key}) : super(key: key);
//
//   @override
//   State<DoctorBooking> createState() => _DoctorBookingState();
// }
//
// class _DoctorBookingState extends State<DoctorBooking> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime ? _selectedDay;
//   @override
//   void initState() {
//     super.initState();
//     _selectedDay=_focusedDay;
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   void _onDaySelected(DateTime selectedDay ,DateTime focusedDay) {
//     if (!isSameDay(_selectedDay,focusedDay)){
//       setState(() {
//         _selectedDay=selectedDay;
//         _focusedDay =focusedDay;
//       });
//
//     }
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('lolo'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             firstDay: DateTime.utc(2010,3,14),
//             lastDay: DateTime.utc(2030,3,14),
//             focusedDay: _focusedDay,
//             calendarFormat: _calendarFormat,
//             startingDayOfWeek: StartingDayOfWeek.sunday,
//             onDaySelected: _onDaySelected,
//             calendarStyle: CalendarStyle(outsideDaysVisible: false,),
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//
//
//
//           ),
//           SizedBox(height: 8.0,)
//         ],
//       ),
//     );
//   }
// }
//
// class DoctorBookings extends StatefulWidget {
//   @override
//   _DoctorBookingsState createState() => _DoctorBookingsState();
// }
//
// class _DoctorBookingsState extends State<_DoctorBookingsState> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//   }
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }
//
//   List<Event> _getEventsForRange(DateTime start, DateTime end) {
//     // Implementation example
//    // final days = daysInRange(start, end);
//
//     return [
//       for (final d in days) ..._getEventsForDay(d),
//     ];
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = null;
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       _rangeSelectionMode = RangeSelectionMode.toggledOn;
//     });
//
//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       _selectedEvents.value = _getEventsForRange(start, end);
//     } else if (start != null) {
//       _selectedEvents.value = _getEventsForDay(start);
//     } else if (end != null) {
//       _selectedEvents.value = _getEventsForDay(end);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Events'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar<Event>(
//             firstDay: kFirstDay,
//             lastDay: kLastDay,
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat,
//             rangeSelectionMode: _rangeSelectionMode,
//             eventLoader: _getEventsForDay,
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             calendarStyle: CalendarStyle(
//               // Use `CalendarStyle` to customize the UI
//               outsideDaysVisible: false,
//             ),
//             onDaySelected: _onDaySelected,
//             onRangeSelected: _onRangeSelected,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0),
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () => print('${value[index]}'),
//                         title: Text('${value[index]}'),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//


// class DoctorBooking extends StatelessWidget {
//   DoctorBooking();
//   DoctorBookingController doctorBookingController = Get.put(DoctorBookingController());
//   DateTime selectedDay = DateTime.now();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("حجوزات الطبيب"),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TableCalendar(
//               firstDay: DateTime.now().subtract(Duration(days: 365)),
//               lastDay: DateTime.now().add(Duration(days: 365)),
//               focusedDay: DateTime.now(),
//               onDaySelected: (selectedDay, focusedDay) {
//                 //doctorBookingController.setSelectedDay(selectedDay);
//               },
//             ),
//             Expanded(
//               child: GetBuilder<DoctorBookingController>(
//                 builder: (controller) {
//                  return TableCalendar(
//
//                   final selectedDay = controller.selectedDay;
//                   final data = controller.filteredData;
//
//                   return ListView.builder(
//                   //  itemCount: data.length,
//                     itemBuilder: (context, index) {
//                       final booking = data[index];
//                       final bookingDateStr = booking['BookingDate'];
//                       final parts = bookingDateStr.split('/');
//                       final year = int.parse(parts[0]);
//                       final month = int.parse(parts[1]);
//                       final day = int.parse(parts[2]);
//                       final time = parts[3].split(':');
//                       final hour = int.parse(time[0]);
//                       final minute = int.parse(time[1]);
//
//                       final bookingDate = DateTime(year, month, day, hour, minute);
//
//                       return ListTile(
//                         title: Text(booking['patient_medical_record'][0]['FullName']),
//                         subtitle: Text("الوقت: ${bookingDate.hour}:${bookingDate.minute}"),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Event {
//   final String eventName;
//   final DateTime from;
//   final DateTime to;
//
//   Event({required this.eventName, required this.from, required this.to});
// }
//
// class CalendarController extends GetxController {
//   final events = <Event>[
//     Event(
//       eventName: 'راما سبعة',
//       from: DateTime(2023, 5, 3, 2, 30, 0, 0, 0),
//       to: DateTime(2000, 1, 23, 3, 0, 0, 0, 0),
//     ),
//     Event(
//       eventName: 'رامي سبعة',
//       from: DateTime(2023, 5, 8, 2, 30, 0, 0, 0),
//       to: DateTime(2023, 5, 8, 2, 30, 0, 0, 0),
//     ),
//     Event(
//       eventName: 'سامي سامر',
//       from: DateTime(2023, 5, 20, 2, 30, 0, 0, 0),
//       to: DateTime(2023, 5, 20, 2, 30, 0, 0, 0),
//     ),
//   ];
//
//   // List<Appointment> get appointments => events.map((event) {
//   //       return Appointment(
//   //           startTime: event.from,
//   //           endTime: event.to,
//   //           subject: event.eventName,
//   //           color: Color(0xff9bb4fd));
//   //     }).toList();
//
//  //final dataSource = AppointmentDataSource(<Appointment>[]);
//
//   @override
//   void onInit() {
//     super.onInit();
//    // dataSource.appointments = appointments;
//   }
// }
//
// // class AppointmentDataSource extends CalendarDataSource {
// //   AppointmentDataSource(List<Appointment> source) {
// //     //appointments = source;
// //   }
// //}