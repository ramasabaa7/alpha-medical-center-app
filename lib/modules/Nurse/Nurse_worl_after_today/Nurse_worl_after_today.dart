import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/Nurse/Home/homeNurseController.dart';
class Nurse_worl_after_today extends StatelessWidget {
  const Nurse_worl_after_today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeNurseController controller = Get.put(homeNurseController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 220, bottom: 20),
            child: Text(
              'المهام القادمة ',
              style: TextStyle(color: Colors.black54, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color(0xff9bb4fd),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount:controller.data_names_doctor.length ,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xff9bb4fd), // تحديد لون الحدود الجديد
                          width: 2.0, // تحديد عرض الحدود الجديدة
                        ),
                        borderRadius:
                        BorderRadius.circular(10.0), // تحديد شكل الحواف
                      ),

                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                            Text("${controller.data_names_doctor[index]}",style: TextStyle(
                                fontWeight: FontWeight.w700 ,fontSize: 17,color:Color(0xff9bb4fd)
                            ),),
                              SizedBox(width:40,height: 10,),
                              Text("  اسم الطبيب ",style: TextStyle(
                                  fontWeight: FontWeight.w700,fontSize: 17
                              ),),
                              SizedBox(width:20,height: 10,),                          ],)
                          ,
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children:
                          [
                            Text("${controller.listOfFollowerData[index]['StartTime']}",style: TextStyle(
                                fontWeight: FontWeight.w700,color: Color(0xff9bb4fd)
                            ),)
                            ,
                            SizedBox(width:70,height: 10,),
                            Text("بداية ",style: TextStyle(
                                fontWeight: FontWeight.w700,fontSize: 17
                            ),),
                            SizedBox(width:20,height: 10,),
                          ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                            Text("${controller.listOfFollowerData[index]['EndTime']}",style: TextStyle(
                                fontWeight: FontWeight.w700,color: Color(0xff9bb4fd)
                            ),),
                              SizedBox(width:70,height: 10,),
                            Text("نهاية ",style: TextStyle(
                                fontWeight: FontWeight.w700
                            ),),
                              SizedBox(width:20,height: 10,),
                          ],)

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
