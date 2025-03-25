import 'package:flutter/material.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Notifications_manager extends StatelessWidget {
  const Notifications_manager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,
        title: const ListTile(
          leading: Text(
            "الإشعارات",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, int) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: StaticColor.thirdgrey.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    AssetImage("assets/images/patient_profile.png"),
                    backgroundColor: StaticColor.primarycolor,
                  ),
                  title: Container(

                    margin: const EdgeInsets.only(top: 15),
                    child: const Text(
                      "القسم",
                    ),
                  ),
                  trailing: const Text(
                    "2023-4-22 8:30",
                    style: TextStyle(color: StaticColor.primarycolor),
                  ),
                  subtitle:const Text(
                    "نص الإشعار",
                  ),
                ),
              ),
            );
          },

          // crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),

      //   ),
    );
  }
}
