import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/class/StatusRequest.dart';
import '../../../static_colors/StaticColors.dart';
import 'VisitsListControllerX_Ray.dart';


class VisitsListX_Ray extends StatelessWidget {
  VisitsListControllerX_Ray controller = Get.find();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'سجل المريض ',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body:GetBuilder<VisitsListControllerX_Ray>(builder: (controller) {
       return SafeArea(

          child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              // add some space between the title and the icon
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: () {
                    controller.get_patieninfobytid(controller.id_patient);
                  },
                  child: Container(
                    color: Color.fromARGB(100, 189, 189, 189).withAlpha(50),
                    // margin: const EdgeInsets.only(bottom: 7,left: 7,right: 7),
                    width: Get.width,
                    height: 60,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(Icons.arrow_back_ios,
                              color: Color(0xff9bb4fd)),
                        ),
                        Text(
                          "البيانات الشخصية للمريض ",
                          style: TextStyle(
                            color: Color(0x8e000000),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(
                            Icons.featured_play_list_outlined,
                            color: Color(0xff9bb4fd),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'سجل الزيارات',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 25,
                    color: Colors.black54,
                  ),
                ),
              ),
              controller.statusRequest == StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
              Container(
                height: MediaQuery.of(context).size.height - 160, // ارتفاع المحتوى
                child:Directionality(
                  textDirection: TextDirection.rtl, // تحديد اتجاه النص من اليمين لليسار
                  child: GridView.builder(
                    itemCount: controller.date.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3.3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed('/detailvistexray');
                        },
                        child: SizedBox(
                          height: 50,
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: StaticColor.primarycolor,
                                width: 2,
                              ),
                            ),
                            child:  Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 45),
                                child: Text(
                                  '${controller.date[index]}',
                                  style: TextStyle(fontSize: 18, color: Colors.black54),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),


                            ],
                          ),
                          ),
                        ),
                      );
                    },
                    // ...
                  ),
                )
              ),

            ],
          ),
        ),
      );
      })
    );
  }

  Widget visit() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: controller.toggleDetails,
        child: Container(
          width: Get.width * 0.90,
          //height: Get.height * 0.20,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff9bb4fd),
                width: 2.2,
              ),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white),

          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      // width: 0.5,
                      ),
                  Icon(Icons.arrow_drop_down_sharp),
                  Text(
                    '12-3-2022',
                  ),
                  SizedBox(
                    width: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Obx(() {
                if (controller.showDetails.value) {
                  return Column(
                    children: [

                       ashaa(),

                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
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
