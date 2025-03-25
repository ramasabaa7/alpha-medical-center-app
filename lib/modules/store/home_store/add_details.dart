import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../static_colors/StaticColors.dart';
import 'addDetailscontroller.dart';


class add_Details extends StatelessWidget {

  addmatirialcontoller controller =addmatirialcontoller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'إضافة مادة ',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
        body: SingleChildScrollView(
       child :Column (
        children: [
          SizedBox(height: 25),
          Padding(
              padding: EdgeInsets.symmetric( horizontal: 20),
              child :
              Row(

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ': اسم المادة',

                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),

                    )])),
          SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric( horizontal: 20),
              child :
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            controller.name=value;

                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ),

                  ])),
          SizedBox(height: 25),

          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column (
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric( horizontal: 20),
                      child :

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '  : الحد الادني  ',

                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),

                            )]),),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        child :
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {

                                      controller.lower = value  ;
                                      print(controller.lower);

                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                ),
                              ),

                            ])),


                  ],
                ),
                Column (
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric( horizontal: 20),
                      child :

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '   : الكمية ',

                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),

                            )]),),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        child :
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      controller.quantity= value;

                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                ),
                              ),

                            ])),


                  ],
                ),

              ]),
          SizedBox(height: 25),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column (
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric( horizontal: 20),
                      child :

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '  : تاريخ الانتهاء  ',

                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),

                            )]),),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        child :
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextField(

                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      controller.Expiry= value;

                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                ),
                              ),

                            ])),


                  ],
                ),
                Column (
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric( horizontal: 20),
                      child :

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '  : تاريخ الاستلام',

                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),

                            )]),),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.symmetric( horizontal: 20),
                        child :
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      controller.production = value;

                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                ),
                              ),

                            ])),


                  ],
                ),

              ]),
          GestureDetector(
            onTap: () {
              controller.AddMatirial();


            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 220,
                height: 50,

                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xffcbd6fa),
                  borderRadius: BorderRadius.circular(25),
                ),


                child:  Align(
                  alignment: Alignment.center,
                  child:

                  Text(
                    'إضافة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,

                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),)
    );
  }
}
