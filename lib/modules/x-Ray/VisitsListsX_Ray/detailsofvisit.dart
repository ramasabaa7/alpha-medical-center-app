import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../static_colors/StaticColors.dart';
import 'VisitsListControllerX_Ray.dart';
class DetailVistexrayPage extends StatefulWidget {
  @override
  detailvistexray createState() => detailvistexray();
}

class detailvistexray extends State<DetailVistexrayPage> {


  @override
  Widget build(BuildContext context) {
    VisitsListControllerX_Ray controller = Get.find();

    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          toolbarHeight: 90,
          elevation: 0,
          backgroundColor: Color(0xff9bb4fd),
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
            child: Text(
              'تفاصيل زيارة',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 180, // ارتفاع المحتوى
                    child: GridView.builder(
                      itemCount: controller.data[0].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio:2,
                      ),
                      itemBuilder: (BuildContext context, int index) {

                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: StaticColor.primarycolor,
                              width: 1,
                            ),
                          ),
                          child:
                          Column(children: [

                          Text('أشعة',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w100,
                                color: Colors.black45,
                              )),
                          widget1('اسم الصورة', '${controller.data[0][index]['required_patient_services']['center_service']['Name']}', Icons.edit_note_sharp),
                          widget1(
                              'تقرير الطبيب',
                              ' ${controller.data[0][index]['Details']} ',
                              Icons.library_books_sharp),
                          SizedBox(
                            height: 10,
                          ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[

                              TextButton(
                                  onPressed: () {
                                    Get.toNamed('/EditVisitx_ray');
                                  },
                                  child: Text(
                                    'تعديل',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9bb4fd),
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                  onPressed: () {
                                   controller.downloadxray(controller.data[0][index]['id']);
                                  },
                                  child: Text(
                                    'تحميل',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9bb4fd),
                                    ),
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('تأكيد الحذف'),
                                              content: Text('هل أنت متأكد من حذف هذا التحليل؟'),
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
                                                    controller.delete_test(controller.data[0][index]['id']);
                                                    setState(() {
                                                      controller.data[0].removeAt(index);
                                                    });



                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'حذف',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff9bb4fd),
                                        ),
                                      )),

                            ]),
                        ])
                        ); },
                    ),
                  ),


                ],
              ),
            ),
          )

    );
  }



  Widget widget1(String s1, String string, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7, left: 7, right: 7),
      width: Get.width,
      // height: 60,
      color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Text(
                '${string}',
                maxLines: null,
                textAlign: TextAlign.center,
              )),
          Text('  :  ' + '${s1}', maxLines: null, textAlign: TextAlign.center),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: Color(0xff9bb4fd),
            ),
          )
        ],
      ),
    );
  }



  Widget ashaa() {
    return Column(children: [
      Row( children:[
        TextButton(
          onPressed: () {
            Get.toNamed('/EditVisitx_ray');
          },
          child: Text(
            'تعديل',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff9bb4fd),
            ),
          )),
        SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: () {
              Get.toNamed('/EditVisitx_ray');
            },
            child: Text(
              'تحميل',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff9bb4fd),
              ),
            )),


      ]),
      Text('أشعة',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w100,
            color: Colors.black45,
          )),
      widget1('اسم الصورة', 'رنين مغناطيسي', Icons.edit_note_sharp),
      widget1(
          'تقرير الطبيب',
          'بتلنتلبلفعغهعهمتنالبف تقه لغفق تغقغغعف عقغقغ عغفع فعفعف غل التان اابيب ابابيا ليياب ابافف بابفغق بفقفغ عقغعتبغ بعع غففث تغقغفث تغبع يا اب تب لياب  ',
          Icons.library_books_sharp),
      widget1('اسم الطبيب', 'سامر اسماعيل', Icons.co_present_outlined),
      SizedBox(
        height: 20,
      )
    ]);
  }


}
