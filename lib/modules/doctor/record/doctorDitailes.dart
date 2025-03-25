import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDitailes extends StatelessWidget {
  const DoctorDitailes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),

        title: Padding(
          padding: const EdgeInsets.only(top: 30.0,left: 120,bottom: 20),
          child: Text(
            ' تفاصيل الطبيب ',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  // const Text(
                  //   "الملاحظات و سبب التحويل",
                  //   style: TextStyle(fontSize: 20,),
                  // ),
                  // Center(
                  //   child: Container(
                  //     margin: EdgeInsets.only(top: 10),
                  //     padding: const EdgeInsets.all(8),
                  //     //height: Get.height * 0.05,
                  //     width: Get.width * 0.8,
                  //     decoration: BoxDecoration(
                  //       color: StaticColor.thirdgrey,
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //     child: const Text(
                  //       " نملتثقمنتا نتثا تلثقت منثتلثمقت ملتقثتل نتلثنتل نملتقث نلثتل تقنتل تلتتل ",
                  //       style: TextStyle(
                  //           fontSize: 15, color:Colors.black54),
                  //       textAlign: TextAlign.end,
                  //     ),
                  //   ),
                  // ),
                  // const Divider(
                  //   endIndent:18,
                  //   indent: 18,
                  //   height: 0,
                  //   thickness: 1.7,
                  //   color: StaticColor.primarycolor,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // const Divider(
                  //   height: 20,
                  //   color: Colors.black45,
                  // ),
                  // const Text(
                  //   "تفاصيل الطبيب",
                  //   style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  // ),
                  //

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "اسم الطبيب",
                    style: TextStyle(fontSize: 20,color: Colors.black54, ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 7),
                      padding: const EdgeInsets.all(8),
                      height: Get.height * 0.05,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "سامر أحمد",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black45),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent:18,
                    indent: 18,
                    height: 0,
                    thickness: 1.7,
                    color: Color(0xff9bb4fd),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "الإختصاص",
                    style: TextStyle(fontSize: 20,color: Colors.black54,),
                  ),
                  Center(
                    child: Container(

                      margin: EdgeInsets.only(top: 7),
                      padding: const EdgeInsets.all(8),
                      height: Get.height * 0.05,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "القلبية",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black45),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent:18,
                    indent: 18,
                    height: 0,
                    thickness: 1.7,
                    color: Color(0xff9bb4fd),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "رقم الهاتف",
                    style: TextStyle(fontSize: 20,color: Colors.black54,),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 7),
                      padding: const EdgeInsets.all(8),
                      height: Get.height * 0.05,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "093425123",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black45),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent:18,
                    indent: 18,
                    height: 0,
                    thickness: 1.7,
                    color: Color(0xff9bb4fd),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "أيام الدوام",
                    style: TextStyle(fontSize: 20,color: Colors.black54,),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 7),
                      padding: const EdgeInsets.all(8),
                      height: Get.height * 0.05,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "الأحد الخميس",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black45),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    endIndent:18,
                    indent: 18,
                    height: 0,
                    thickness: 1.7,
                    color: Color(0xff9bb4fd),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "ساعات الدوام",
                    style: TextStyle(fontSize: 20,color: Colors.black54,),
                  ),

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 7),
                      padding: const EdgeInsets.all(8),
                      height: Get.height * 0.05,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        color:Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "6-8",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black45),
                        textAlign: TextAlign.end,
                      ),

                    ),

                  ),
                  const Divider(
                    endIndent:18,
                    indent: 18,
                    height: 0,
                    thickness: 1.7,
                    color: Color(0xff9bb4fd),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                ],

              ),
            ),


          ],


         ),
      ),
    );
  }
}
