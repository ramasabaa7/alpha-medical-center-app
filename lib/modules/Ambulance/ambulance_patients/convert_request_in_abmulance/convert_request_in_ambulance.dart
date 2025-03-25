import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/convert_request_in_abmulance/convert_request_in_ambulance_controller.dart';
import 'package:project_after_update/modules/reception/patient/convert_request/convert_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Convert_request_in_ambulance extends StatelessWidget {
  const Convert_request_in_ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Convert_request_in_ambulance_controller controller =Get.put<Convert_request_in_ambulance_controller>(Convert_request_in_ambulance_controller());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              clipBehavior:Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                      color: StaticColor.primarycolor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                ),
                Positioned(
                  top:70,
                  left: 130,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: Image.asset("assets/images/transmission.png",fit: BoxFit.fill,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "طلب تحويل",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.40,
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ListTile(
                            trailing: const Text("الخدمة"),
                            subtitle:DropDownMultiSelect(
                              options:controller.center_services,
                              whenEmpty: "إختر الخدمة",
                              onChanged: (value){
                                controller.selectedoptionlist_centerservices.value=value;
                                controller.selectedoption_centerservices.value="";
                                controller.selectedoptionlist_centerservices.value.forEach((element) {
                                  controller.selectedoption_centerservices.value=controller.selectedoption_centerservices.value+" " +element;
                                });
                              },
                              selectedValues:controller.selectedoptionlist_centerservices.value,
                            ),
                          ),
                          ListTile(
                            trailing: const Text("القسم"),
                            subtitle:DropDownMultiSelect(
                              options:controller.center_department,
                              whenEmpty: "إختر القسم",
                              onChanged: (value){
                                controller.selectedoptionlist_centerdepartment.value=value;
                                controller.selectedoption_centerdepartment.value="";
                                controller.selectedoptionlist_centerdepartment.value.forEach((element) {
                                  controller.selectedoption_centerdepartment.value=controller.selectedoption_centerdepartment.value+" " +element;
                                });
                              },
                              selectedValues:controller.selectedoptionlist_centerdepartment.value,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: StaticColor.primarycolor,
                            ),
                            child: const Text("تحويل",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
