import 'package:flutter/material.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Home_ambulance extends StatelessWidget {
  const Home_ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          prefixIcon: const Icon(Icons.search),
                          hintText: "البحث",
                          hintStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.grey[200]),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: StaticColor.primarycolor,
                  ),
                  width: 60,
                  height: 55,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed("/notification");
                    },
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(
                  "قسم الإسعاف",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:50,
                      width: 60,
                      child: Image.asset(
                        "assets/images/ambulance.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Text(
                      "مركز ألفا الطبي",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),

                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black45,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
