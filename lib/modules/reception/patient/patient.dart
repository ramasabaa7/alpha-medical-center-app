import 'package:flutter/material.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Patient extends StatelessWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Patient_details_controller controller =
        Get.put(Patient_details_controller());
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
                    "عرض تفاصيل المرضى",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/images/patient.png"),
                      ),
                      const Text(
                        "يرجى إدخال الرقم الوطني",
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
                //  key: controller.formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 14, 14, "idpersonal");
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.id_patient = value;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            " الرقم الوطني ",
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
                            "بحث",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ListView.builder(shrinkWrap:true,itemCount:4,itemBuilder: (context,index){
              //   return
              //     Container(
              //       padding: EdgeInsets.all(10),
              //       margin: EdgeInsets.only(top: 10),
              //       height: MediaQuery.of(context).size.height*0.1,
              //       width: MediaQuery.of(context).size.width*0.8,
              //       decoration: BoxDecoration(
              //           color: StaticColor.thirdgrey.withAlpha(30),
              //           borderRadius: BorderRadius.circular(20)
              //       ),
              //       child:  Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             IconButton(icon:Icon(Icons.arrow_back),onPressed: ()async{
              //              await controller.get_patient_details();
              //               Get.toNamed("/patient_details");
              //
              //
              //             },),
              //             SizedBox(width: 10),
              //             CircleAvatar(
              //               radius: 25,
              //               child: Image.asset("assets/images/patient_profile.png"),
              //             ),
              //           ],
              //         ),
              //           Text("محمد سعيد",style: TextStyle(fontWeight:FontWeight.bold),),
              //
              //         ],
              //       ),
              //     );
              //
              // }),
            ),
          ],
        ),
      ),
    );
  }
}
