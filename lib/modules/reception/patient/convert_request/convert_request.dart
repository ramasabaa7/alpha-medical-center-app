import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/modules/reception/patient/convert_request/convert_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Convert_request extends StatelessWidget {
  const Convert_request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Convert_request_controller controller =
        Get.put<Convert_request_controller>(Convert_request_controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
        ),
        body: GetBuilder<Convert_request_controller>(builder: (controller) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      decoration: BoxDecoration(
                          color: StaticColor.primarycolor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                    Positioned(
                      top: 70,
                      left: 130,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 45,
                        child: Image.asset(
                          "assets/images/transmission.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "قسم الإستقبال",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: double.infinity,
                        //   padding: const EdgeInsets.all(8),
                        child:
                            // Card(
                            //   child:
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: StaticColor.primarycolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  DropdownButton(
                                    items: controller.data_service_to_show
                                        .map((e) => DropdownMenuItem(
                                              child: Text("$e"),
                                              value: e,
                                            ))
                                        .toList(),
                                    onChanged: (val) {
                                      controller
                                          .changedepartment(val as String);
                                      controller.type = val;
                                      controller.selected = val.toString();
                                      // print(controller.selected);
                                    },
                                    // value: controller.selected,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    hint: Text("${controller.selected}"),
                                  ),
                                ],
                                // DropDownMultiSelect(
                                //   options:controller.data_service_to_show,
                                //   whenEmpty: "إختر الخدمة",
                                //   onChanged: (value){
                                //     controller.selectedoptionlist_centerservices.value=value as List<String>;
                                //     controller.selectedoption_centerservices.value="";
                                //     controller.selectedoptionlist_centerservices.value.forEach((element) {
                                //       controller.selectedoption_centerservices.value=controller.selectedoption_centerservices.value+" " +element;
                                //     });
                                //   },
                                //   selectedValues:controller.selectedoptionlist_centerservices.value,
                                // ),
                              ),
                            ),
                            //  const SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () {
                                controller.add_service_for_patient();
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
                                  "تحويل",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
