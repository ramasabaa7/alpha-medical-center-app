





import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/doctor/bookings/DoctorBookingService.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class DoctorBookingController extends GetxController{

  @override
  void onInit() {
    get_Doctor_booking(6);
    calender_event();
    // TODO: implement onInit
    super.onInit();
  }
  DoctorBookingService services = DoctorBookingService(Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  get_Doctor_booking(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_doctor_booking(id);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("this is patient boooooooooooking");
      calender_event();
      print(data);
      //Get.toNamed("/Ambulance_patients_visits");
    }   else if(test_data.isEmpty) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد زيارات لعرضها",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد زيارات لعرضها",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }

  final Map<DateTime,List<CleanCalendarEvent>> events = {};
  //final Map<DateTime, List<Map<String, String>>> appointments = {};
  calender_event(){
    for (int i = 0; i < data.length ; i++)
    { print("int ");
    print(i);
    final booking = data[i];
    String bookingDateStr = booking['BookingDate'];
    String day =bookingDateStr.substring(8,10);
    String month =bookingDateStr.substring(5,7);
    String year =bookingDateStr.substring(0,4);
    String hour = bookingDateStr.substring(11,13);
    String minute =bookingDateStr.substring(14,16);
    print("rama");
    print( "${year}  ${month}   ${day}  ${hour}   ${minute}");int yearInt = int.parse(year);
    int monthInt = int.parse(month);
    int dayInt = int.parse(day);
    int hourInt = int.parse(hour);
    int minuteInt = int.parse(minute);
    int hourIntend = int.parse(hour);
    int minuteIntend = int.parse(minute);
    if (minuteInt==30)
    {minuteIntend =0;
    hourIntend=hourInt +1;

    }

    DateTime date = DateTime(yearInt, monthInt, dayInt);
    List<CleanCalendarEvent> appointmentsList = events[date] ?? [];
    if (appointmentsList.isNotEmpty) {
      print("isNotEmpty");
      // add new appointment to existing list
      appointmentsList.add(CleanCalendarEvent('${booking['patient_medical_record']['FullName']}',
          startTime: DateTime(yearInt,minuteInt,
              dayInt , hourInt, minuteInt),
          endTime: DateTime(yearInt,minuteInt,
              dayInt , hourInt, minuteInt),
          color: Color(0xff9bb4fd)));
    } else {
      print("isEmpty");
      appointmentsList = [
        CleanCalendarEvent('${booking['patient_medical_record']['FullName']}',
            startTime: DateTime(yearInt,minuteInt, dayInt , hourInt, minuteInt),
            endTime: DateTime(yearInt,minuteInt, dayInt , hourIntend, minuteIntend),
            color: Color(0xff9bb4fd))];

    }
    print(appointmentsList);
    events[date] = appointmentsList;


    }



    // events.addAll(
    //   {
    //
    //   }
    // )
    //
    // List<CleanCalendarEvent> newEvents = [CleanCalendarEvent(), CleanCalendarEvent()];
    //
  }





}


//
// import 'Event.dart';
//
// class CalendarController extends GetxController {
//   CalendarController();
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
//   List<Appointment> get appointments => events.map((event) {
//     return Appointment(
//         startTime: event.from,
//         endTime: event.to,
//         subject: event.eventName,
//         color: Color(0xff9bb4fd));
//   }).toList();
//
//   final dataSource = AppointmentDataSource(<Appointment>[]);
//
//   @override
//   void onInit() {
//     super.onInit();
//     dataSource.appointments = appointments;
//   }
// }

