import 'package:flutter/material.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Patient_details_in_managment extends StatelessWidget {
  const Patient_details_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  GestureDetector(
        onTap: (){
          Get.toNamed("/Patient_Visits_in_managment");
        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.08,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/images/information.png",
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                "سجل الزيارات",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
              ),

            ],
          ),

        ),
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: const BoxDecoration(
                    color: StaticColor.primarycolor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              Positioned(
                top: 100,
                left: 130,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Image.asset("assets/images/patient_profile.png"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "قسم الإدارة",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 60,
                      child: Image.asset(
                        "assets/images/patient_details.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Text(
                      "بيانات المريض",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                const Divider(
                  height: 5,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            padding: const EdgeInsets.all(8),
            child: ListView(

              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: StaticColor.thirdgrey.withAlpha(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("محمد سعيد :"),
                      Text(" المريض",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.person,
                        color: StaticColor.primarycolor,
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: StaticColor.thirdgrey.withAlpha(30),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("0188756598  :"),
                      Text("الرقم الوطني ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.credit_card_rounded,
                        color: StaticColor.primarycolor,
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: StaticColor.thirdgrey.withAlpha(30),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("40:"),
                      Text("العمر",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.person_pin_rounded,
                        color: StaticColor.primarycolor,
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: StaticColor.thirdgrey.withAlpha(30),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("دمشق:"),
                      Text("العنوان",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.location_on,
                        color: StaticColor.primarycolor,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: StaticColor.thirdgrey.withAlpha(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("093476155:"),
                      Text("رقم الهاتف",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.phone,
                        color: StaticColor.primarycolor,
                      )
                    ],
                  ),

                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
