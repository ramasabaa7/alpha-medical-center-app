import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';

import '../../../static_colors/StaticColors.dart';


class Details extends StatelessWidget {
  warehouseControllerstor controller = Get.find();

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
            'تفاصيل المادة ',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
       child :
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
              child:TextField(
                controller: TextEditingController(text: "${controller.data_details[controller.index]['Name']}"),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print("fffffffff");
                  print (controller.id);
                 controller.name =value ;
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
                                 child:TextField(
                                   controller: TextEditingController(text: "${controller.data_details[controller.index]['Lower_Limit']}"),
                                   textAlign: TextAlign.center,
                                   keyboardType: TextInputType.number,
                                   onChanged: (value) {
                                     controller.lower = value;

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
                             child:TextField(
                               controller: TextEditingController(text: "${controller.data_details[controller.index]['Quantity']}"),
                               textAlign: TextAlign.center,
                               keyboardType: TextInputType.number,
                               onChanged: (value) {
                                controller.quantity=value;

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
                                  child:TextField(
                                    controller: TextEditingController(text: "${controller.data_details[controller.index]['ExpiryDate']}"),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      controller.Expiry=value;

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
                                  child:TextField(
                                    controller: TextEditingController(text: "${controller.data_details[controller.index]['ProductionDate']}"),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      controller.production= value;

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
          SizedBox(height: 38),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('تأكيد التعديل'),
                    content: Text('هل أنت متأكد من تعديل هذا المادة؟'),
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
                          controller.updateMatirial();

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 220,
                height: 50,

                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xffcbd6fa),
                  borderRadius: BorderRadius.circular(25),
                ),


                child:  Align(
                alignment: Alignment.center,
                  child:

                        Text(
                          'تعديل المادة',
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
          SizedBox(height: 10),

        ],
      ),)
    );
  }
}
