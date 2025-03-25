import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_details/ambulance_patient_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';
class Ambulance_patients extends StatelessWidget {
  const Ambulance_patients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Ambulance_Patient_details_controller ambulance_patient_details_controller =Get.put(Ambulance_Patient_details_controller());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<Ambulance_Patient_details_controller>(builder: (controller) {
          return
          controller.statusRequest == StatusRequest.loading ?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),) :
          Container(
            height: MediaQuery.of(context).size.height,
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
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
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
                          onPressed: () {},
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "قسم الإسعاف",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 60,
                            child: Image.asset("assets/images/health-insurance.png"),
                          ),
                          const Text(
                            "الحالات الإسعافية",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black45,
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ), Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(20),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Form(
                  //  key: controller.formstatenew,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (val){
                            return validinput(val!, 14,14,"idpersonal");
                          },
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            controller.id_patient=value ;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              label:  const Text(
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
                                "إضافة",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   height: MediaQuery.of(context).size.height*0.6,
                //   child: ListView.builder(shrinkWrap:true,itemCount:4,itemBuilder: (context,index){
                //     return
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         margin: EdgeInsets.only(top: 10),
                //         height: MediaQuery.of(context).size.height*0.1,
                //         width: MediaQuery.of(context).size.width*0.8,
                //         decoration: BoxDecoration(
                //             color: StaticColor.thirdgrey.withAlpha(30),
                //             borderRadius: BorderRadius.circular(20)
                //         ),
                //         child:  Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 IconButton(icon:Icon(Icons.arrow_back),onPressed: ()async{
                //                   await ambulance_patient_details_controller.get_patient_details();
                //                     Get.toNamed("/Ambulance_patients_details");
                //                 },),
                //                 SizedBox(width: 10),
                //                 Container(
                //                   height:35,
                //                   width: 35,
                //                   child: Image.asset(
                //                     "assets/images/ambulance_symbol.png",
                //                     fit: BoxFit.fill,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Text("محمد سعيد",style: TextStyle(fontWeight:FontWeight.bold),),
                //
                //           ],
                //         ),
                //       );
                //
                //   }),
                // ),

              ],
            ),
          );
        })
      ),
    );
  }
}
