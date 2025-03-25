import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/convert_request_in_abmulance/convert_request_in_ambulance_controller.dart';
import 'package:project_after_update/modules/Ambulance/request_consumable/request_consumable_controller.dart';
import 'package:project_after_update/modules/reception/patient/convert_request/convert_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Request_consumable extends StatelessWidget {
  const Request_consumable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Request_consumable_controller controller =
        Get.put<Request_consumable_controller>(Request_consumable_controller());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: const BoxDecoration(
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
                    "قسم الإسعاف",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "طلب مستهلكات",
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {},
                                    decoration: const InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        //  prefixIcon: const Icon(Icons.qua),
                                        contentPadding:
                                            EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                            // borderRadius:
                                            //     BorderRadius.circular(20),
                                            )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Text(
                                    " : الكمية  ",
                                    style: TextStyle(
                                        color: StaticColor.primarycolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            trailing: const Text(
                              " : المستهلك",
                              style: TextStyle(
                                  color: StaticColor.primarycolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: DropDownMultiSelect(
                              options: controller.center_services,
                              whenEmpty: "إختر المستهلكات",
                              onChanged: (value) {
                                controller.selectedoptionlist_centerservices
                                    .value = value;
                                controller.selectedoption_centerservices.value =
                                "";
                                controller
                                    .selectedoptionlist_centerservices.value
                                    .forEach((element) {
                                  controller.selectedoption_centerservices
                                      .value = controller
                                      .selectedoption_centerservices.value +
                                      " " +
                                      element;
                                });
                              },
                              selectedValues: controller
                                  .selectedoptionlist_centerservices.value,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: StaticColor.primarycolor,
                            ),
                            child: const Text(
                              "طلب",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
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
