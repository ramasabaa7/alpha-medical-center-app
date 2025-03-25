import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';

import '../../../static_colors/StaticColors.dart';
import 'need_Controllerstor.dart';


class need_Products extends StatelessWidget {
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  childAspectRatio: 1.5,

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

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
             controller.addorder();
             Get.toNamed('/add_order');
              },
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 150,
                height: 50,

                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xffcbd6fa),
                  borderRadius: BorderRadius.circular(25),
                ),


                  child: Padding(
                  padding:  EdgeInsets.symmetric( horizontal: 10),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),


                      SizedBox(width: 10),
                      Text(
                      'طلب المواد',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,

                      ),
                          textDirection: TextDirection.rtl,
                    ),


                    ]),
                 ),
              ),
            ),
          ),
        ],
      ),
    );
  });}



}
