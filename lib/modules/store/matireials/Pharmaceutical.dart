import 'package:flutter/material.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

import '../home_store/warehouseControllerstor.dart';

class Pharmaceutical  extends StatelessWidget {
    Pharmaceutical ({super.key});
  warehouseControllerstor controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: 1,//controller.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
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
                    'controller.products[index].name',
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
                          ('controller.products[index].quantity')
                              .toString(),
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
                  Center(
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            //   controller.updateQuantity(index, value);
                            //controller.errors(int.parse(value), index);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
