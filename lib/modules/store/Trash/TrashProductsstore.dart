import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static_colors/StaticColors.dart';
import 'Trash_Controllerstor.dart';


class Trash_Products extends StatelessWidget {

  Trash_controller controller =  Get.put(Trash_controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Trash_controller>(builder: (controller) {
      return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'المهملات',
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
                                (controller.data_details[index]['ProductionDate'])
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                ' : تاريخ الإدخال',
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
                                (controller.data_details[index]['ExpiryDate'])
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                ' : صلاحية المنتج',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('تأكيد الإتلاف'),
                                  content: Text('هل أنت متأكد من  إتلاف هذه المواد ؟'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('لا'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('نعم'),
                                      onPressed: () {
                                        controller.deletematirial4(controller.data_details[index]['id']);
                                        //controller.data_details.removeAt(index);

                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

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
                                        Icons.delete_outline_rounded,
                                        color: Colors.white,
                                      ),


                                      SizedBox(width: 10),
                                      Text(
                                        'إتلاف المواد',
                                        style: TextStyle(
                                          fontSize: 19,
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
                },
              ),
            ),
          ),

        ],
      ),
    );
  });}
}
