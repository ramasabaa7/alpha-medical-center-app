import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
class financial_sections extends StatelessWidget {
  const financial_sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,

        backgroundColor:Color(0xff9bb4fd),

        title:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [



            Spacer(),
            Expanded(
              child: Text(
                'الأقسام',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 23),
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
      ),
    body: Column(
      children: [
        SizedBox(height:25),
        GestureDetector(
          onTap: () {  Get.toNamed('/financial_Clinic_incoming_material'); },
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20, bottom: 20,top: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff9bb4fd), width: 3),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 2,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x49e1e7f8), Color(0xff9bb4fd)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    alignment: AlignmentDirectional(-1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image:  AssetImage("assets/images/x-rays.png",),color: Color(0xff9bb4fd),width: 50,height: 50,),
                        SizedBox(width: 70,),
                        Center(
                            child: Text(
                              'قسم الأشعة',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w100,
                                color: Colors.black38,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ),
          ),
        ),
        GestureDetector(
          onTap: () {  Get.toNamed('/financial_Clinic'); },
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20, bottom: 20,top: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff9bb4fd), width: 3),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 2,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x49e1e7f8), Color(0xff9bb4fd)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    alignment: AlignmentDirectional(-1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image:  AssetImage("assets/images/preasure.png",),color: Color(0xff9bb4fd),width: 50,height: 50,),
                        SizedBox(width: 70,),
                        Center(
                            child: Text(
                              'العيادات',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w100,
                                color: Colors.black38,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ),
          ),
        ),
        GestureDetector(
          onTap: () {  Get.toNamed('/financial_Clinic_incoming_material'); },
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20, bottom: 20,top: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff9bb4fd), width: 3),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 2,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x49e1e7f8), Color(0xff9bb4fd)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    alignment: AlignmentDirectional(-1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image:  AssetImage("assets/images/test-tube.png",),color: Color(0xff9bb4fd),width: 50,height: 50,),
                        SizedBox(width: 70,),
                        Center(
                            child: Text(
                              'المخبر',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w100,
                                color: Colors.black38,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // ),
          ),
        ),
      ],
    ),
    );


  }
}
