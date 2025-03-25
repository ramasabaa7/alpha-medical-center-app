import 'package:flutter/material.dart';
import 'package:get/get.dart';

class financial_Clinic extends StatelessWidget {
  const financial_Clinic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Expanded(
              child: Text(
                'العيادات',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 23),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/financial_Clinic_incoming_material');
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 65,

                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 35),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xfff3f3fc),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Center(
                    child: Text(
                  'الأطفال',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                    color: Colors.black38,
                  ),
                )),
                // ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/financial_Clinic_incoming_material');
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 65,

                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xfff3f3fc),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Center(
                    child: Text(
                  'القلبية',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                    color: Colors.black38,
                  ),
                )),
                // ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/financial_Clinic_incoming_material');
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 65,

                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xfff3f3fc),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Center(
                    child: Text(
                  'الأسنان',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                    color: Colors.black38,
                  ),
                )),
                // ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/financial_Clinic_incoming_material');
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 65,

                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff9bb4fd), width: 3),
                  color: Color(0xfff3f3fc),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Center(
                    child: Text(
                  'العصبية',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                    color: Colors.black38,
                  ),
                )),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
