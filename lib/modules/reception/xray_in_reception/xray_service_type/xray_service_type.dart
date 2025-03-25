import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/reception/laboratory_in_reception/laboratory_service_type/laboratory_service_type_controller.dart';
import 'package:project_after_update/modules/reception/xray_in_reception/xray_service_type/xray_service_type_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Xray_service_type extends StatelessWidget {
  const Xray_service_type({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Xray_service_type_controller controller=Get.put(Xray_service_type_controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.primarycolor,
      ),
        body: GetBuilder<Xray_service_type_controller>(builder: (controller){
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
                      Text(
                        "أنواع الصور الشعاعية",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset("assets/images/x-rays.png"),
                          ),
                          Text(
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
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed("/Xray_service",arguments: {
                            "id_type" :controller.data[index]['id'],
                            "status":controller.data[index]['Status']
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: StaticColor.primarycolor,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Container(
                                    width: 200,
                                    child: Image.asset(
                                        "assets/images/x-ray_in_center.png",
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${controller.data[index]['Name']}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ]),
            );
        })
    );
  }
}
