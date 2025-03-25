import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/doctor/EditVisit/EditVisitController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

import '../record/patientVisitRecord.dart';
class EditVisit extends StatelessWidget {


  EditVisitController controller = Get.find();

  //if (controller.hint_Pressure== null)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black54,size: 28),
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: Text(
                'تعديل نتيحة المعاينة',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 22, color: Colors.black54),
              ),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [

            SizedBox(
              width: 35,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
               // key: controller.formstate2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 4, 100, "Pressure");
                      },
                      onChanged: (val) {
                        controller.Pressure = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الضغط",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                         hintText: controller.hint_Pressure.toString(),
                        //  hintText: "عالي",
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/preasure.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 2, "BodyHeat");
                      },
                      onChanged: (val) {
                        int value =  int.parse(val);
                        controller.BodyHeat =value;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الحرارة",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                         hintText: controller.hint_BodyHeat.toString(),
                         // hintText: "40",
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/heat.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 4, 100, "ClinicalStory");
                      },
                      onChanged: (val) {
                        controller.ClinicalStory = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            " القصة السريرية ",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        hintText: controller.hint_ClinicalStory.toString(),
                       //   hintText: "ألم  في الرأس و صداع",
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/hospital-bed.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 4, 100, "ClinicalExamination");
                      },
                      onChanged: (val) {
                        controller.ClinicalExamination = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الفحص الطبي",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_ClinicalExamination.toString(),
                        //  hintText: "سليم",
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/weakness.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 100, "Heartbeat");
                      },
                      onChanged: (val) {
                        controller.Heartbeat = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "النبض",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_Heartbeat.toString(),
                          //hintText: "طبيعي",
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(6),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/heart-shape-outline-with-lifeline.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 100, "comments");
                      },
                      onChanged: (val) {
                        controller.comments = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "التشخيص و العلاج",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                         hintText: controller.hint_comments.toString(),
                         // hintText: "صداع مزمن | مسكنات ",
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(170)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(6),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/notes.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    // const Center(
                    //   child: Text(
                    //     "الإجراءات المقدمة للمريض",
                    //     style: TextStyle(fontSize: 15),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   onChanged: (val) {},
                    //   decoration: InputDecoration(
                    //       floatingLabelBehavior: FloatingLabelBehavior.always,
                    //       label: const Text(
                    //         "الإجراءات الشعاعية",
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             color: StaticColor.primarycolor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       suffixIcon: Container(
                    //         padding: EdgeInsets.all(6),
                    //         height: 20,
                    //         width: 20,
                    //         child: Image.asset(
                    //           "assets/images/x-rays.png",
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //       contentPadding: const EdgeInsets.all(10),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   onChanged: (val) {},
                    //   decoration: InputDecoration(
                    //       floatingLabelBehavior: FloatingLabelBehavior.always,
                    //       label: const Text(
                    //         "التشخيص",
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             color: StaticColor.primarycolor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       suffixIcon: Container(
                    //         padding: EdgeInsets.all(6),
                    //         height: 20,
                    //         width: 20,
                    //         child: Image.asset(
                    //           "assets/images/medical-check.png",
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //       contentPadding: const EdgeInsets.all(10),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.edit_result();
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
  Widget buildTextField(String string) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 30,left: 15,right: 15),
      // width: Get.width * 0.90,
      //  height: Get.height * 0.12,

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child:  TextField(


       //   controller: controller.textEditingController,
        textDirection: TextDirection.rtl,
        maxLines: null,
       textAlign: TextAlign.right,

        decoration: InputDecoration(

          labelText:'${string}' ,

//hintText: "jhg",
          labelStyle: TextStyle(color: Colors.indigo,
            fontSize: 22.5,
              fontWeight: FontWeight.bold

          ),

          border: OutlineInputBorder(

            borderSide: BorderSide(color: Colors.indigo),
          ),

        ),
      ),


    );
  }
}
