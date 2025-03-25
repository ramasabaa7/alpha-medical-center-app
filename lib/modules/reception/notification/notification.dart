// import 'package:flutter/material.dart';
// import 'package:project_after_update/static_colors/StaticColors.dart';
//
// class Notifications extends StatelessWidget {
//   const Notifications({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: StaticColor.primarycolor,
//         title: const ListTile(
//           leading: Text(
//             "الإشعارات",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           trailing: Icon(
//             Icons.notifications_active_outlined,
//             color: Colors.white,
//             size: 30,
//           ),
//         ),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: 4,
//           itemBuilder: (context, int) {
//             return Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(bottom: 10),
//                decoration: BoxDecoration(
//                  color: StaticColor.thirdgrey.withAlpha(30),
//                      borderRadius: BorderRadius.circular(20),
//                ),
//                 width: MediaQuery.of(context).size.width,
//                 child: ListTile(
//                   leading: const CircleAvatar(
//                     radius: 30,
//                     backgroundImage:
//                         AssetImage("assets/images/patient_profile.png"),
//                     backgroundColor: StaticColor.primarycolor,
//                   ),
//                   title: Container(
//
//                     margin: const EdgeInsets.only(top: 15),
//                     child: const Text(
//                       "القسم",
//                     ),
//                   ),
//                   trailing: const Text(
//                     "2023-4-22 8:30",
//                     style: TextStyle(color: StaticColor.primarycolor),
//                   ),
//                   subtitle:const Text(
//                     "نص الإشعار",
//                   ),
//                 ),
//               ),
//             );
//           },
//
//           // crossAxisAlignment: CrossAxisAlignment.start,
//         ),
//       ),
//
//       //   ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/notification/notification_controller.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    notification_controller controller =
    Get.put(notification_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "تقديم طلب زيادة راتب",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/images/salary.png"),
                      ),
                      const Text(
                        "يرجى إدخال التفاصيل",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(20),
                  borderRadius: BorderRadius.circular(20)),
              child: Form(
                  key: controller.formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 100, "idpersonal");
                      },
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        controller.details = value;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "تفاصيل الطلب",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.credit_card_outlined),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
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
                            "إرسال",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
