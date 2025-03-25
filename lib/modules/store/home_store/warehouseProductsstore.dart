import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../static_colors/StaticColors.dart';


class warehouseProducts extends StatelessWidget {
  warehouseControllerstor controller = Get.find();

  @override
  Widget build(BuildContext context) {

      return controller.statusRequest == StatusRequest.loading?
        Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
        GridView.builder(
          itemCount: controller.data_details.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                controller.index = index;
                Get.toNamed("/Details",arguments: {
                "Name" : controller.data_details[index]['Name'],
                "Quantity" : controller.data_details[index]['Quantity'],
                "Lower_Limit" : controller.data_details[index]['Lower_Limit'],
                "ProductionDate" : controller.data_details[index]['ProductionDate'],
                  "ExpiryDate" : controller.data_details[index]['ExpiryDate'],
                  "id" : controller.data_details[index]['id']


                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xffb3c6ff), width: 3),
                ),
                width: 20,
                height: 40,
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
                            (controller.data_details[index]['Quantity']).toString(),
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' : الكمية المتوفر',
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
                  ],
                ),
              ),
            );
          },
        );
    }

}
