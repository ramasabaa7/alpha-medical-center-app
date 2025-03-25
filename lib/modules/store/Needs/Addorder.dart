import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';

import '../../../static_colors/StaticColors.dart';
import 'need_Controllerstor.dart';


class add_order extends StatelessWidget {
  need_controller controller =  Get.put(need_controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<need_controller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Color(0xff9bb4fd),
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
            child: Text(
              'الحاجات',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
              const EdgeInsets.only(bottom: 90, right: 20, left: 20, top: 20),
              child: Center(
                child: GridView.builder(
                  itemCount: controller.data_details.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing:3.3,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color(0xffb3c6ff), width: 3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.data_details[index]['Name'],
                            style: TextStyle(
                              color: Color(0xff9bb4fd),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  (controller.data_details[index]['Lower_Limit'])
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ' : الكمية الواجب توافرها',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  (controller.data_details[index]['Quantity'])
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ' : الكمية المتوفرة',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[

                                ElevatedButton(
                                  onPressed: () {
                                    controller.id_order = controller.data_details2[0]['id'];
                                    controller.id_matirial = controller.data_details[index]['id'];
                                    controller.name =controller.data_details[index]['Name'];
                                    controller.additem();

                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                    StaticColor.primarycolor,
                                  ),
                                  child: Text('طلب'),
                                ),
                                SizedBox(width: 30),

                                Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      controller.quantity = value;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                ),

                              ])

                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      );
    });}



}
