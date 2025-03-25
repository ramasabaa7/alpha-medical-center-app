import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/Ambulance/add_result/add_result_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Add_result extends StatelessWidget {
  const Add_result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Add_result_controller controller =Get.put(Add_result_controller());
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 115,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: StaticColor.primarycolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //   margin: EdgeInsets.only(left: 10),
                    //  height:100,
                    // width: 100,
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Text(
                          "مركز ألفا الطبي",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "جميع الإختصاصات الطبية",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "إسعاف - مخبر - أشعة",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "قسم الإسعاف",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "إرفاق نتيجة الحالة الإسعافية",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const Divider(
                      height: 10,
                      color: Colors.black45,
                    ),
                    const Center(
                      child: Text(
                        "العلامات الحيوية",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val){
                        return validinput(val!,4,100,"Pressure");
                      },
                      onChanged: (val) {
                        controller.Pressure=val;
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
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
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
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val){
                        return validinput(val!,2,2,"BodyHeat");
                      },
                      onChanged: (val) {
                        controller.BodyHeat=val;
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
                      validator: (val){
                        return validinput(val!,4,100,"ClinicalStory");
                      },
                      onChanged: (val) {
                        controller.ClinicalStory=val;
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
                      validator: (val){
                        return validinput(val!,4,100,"ClinicalExamination");
                      },
                      onChanged: (val) {
                        controller.ClinicalExamination=val;
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
                      validator: (val){
                        return validinput(val!,2,100,"Heartbeat");
                      },
                      onChanged: (val) {
                        controller.Heartbeat=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "ضربات القلب",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
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
                        onTap: (){
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
}
