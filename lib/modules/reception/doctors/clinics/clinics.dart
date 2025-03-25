import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/reception/doctors/clinics/clinics_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Clinics extends StatelessWidget {
  const Clinics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Clinics_controler controller =Get.put(Clinics_controler());
    return
      Scaffold(
        appBar: AppBar(backgroundColor: StaticColor.primarycolor,),
        body: GetBuilder<Clinics_controler>(builder: (controller){
          return
          controller.statusRequest==StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            Container(
              child: ListView(children: [

                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const Text(
                        "عيادات المركز",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset("assets/images/hospital.png"),
                          ),
                          Text(
                            "مركز ألفا الطبي",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),

                        ],
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black45,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: GridView.builder(
                          itemCount: controller.data.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context,index){
                            return
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/wating_in_clinics",arguments: {
                                    "id":controller.data[index]['id'],
                                    "status":controller.data[index]['Status']
                                  });
                                },
                                child: Container(
                                  // height: MediaQuery.of(context).size.height * 0.3,
                                  // width: MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: StaticColor.primarycolor,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child:
                                          controller.data[index]['Name']=='عيادة أطفال'?
                                          Image.asset(
                                              "assets/images/children.png",
                                              fit: BoxFit.fill):
                                          Image.asset(
                                              "assets/images/hospital.png",
                                              fit: BoxFit.fill) ,
                                        ),
                                        Expanded(
                                            child:
                                            Text(
                                              "${controller.data[index]['Name']}",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 15),
                                            )
                                        )
                                      ],
                                    )),
                              );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
        })
      );
  }
}
