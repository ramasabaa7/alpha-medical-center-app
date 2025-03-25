import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/modules/Nurse/EditVisitNurse/EditVisitNurseController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class EditVisitNurse extends StatelessWidget {
  EditVisitNurseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: Color(0xff9bb4fd),
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 120, bottom: 20),
          child: Text(
            'تفاصيل المعاينة',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              // width: Get.width * 0.90,
              //  height: Get.height * 0.12,

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(

                onChanged: (val) {
                  controller.title= val;},
                //controller: controller.textEditingController,
                textDirection: TextDirection.rtl,
                maxLines: null,
                textAlign: TextAlign.right,

                decoration: InputDecoration(
                  labelText: 'الموضوع',
                  labelStyle: TextStyle(
                      color: Color(0xff88a5fc),
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              // width: Get.width * 0.90,
              //  height: Get.height * 0.12,

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (val) {
                  controller.referringphysician= val;},//controller: controller.textEditingController,
                textDirection: TextDirection.rtl,
                maxLines: null,
                textAlign: TextAlign.right,

                decoration: InputDecoration(
                  labelText: 'الطبيب',
                  labelStyle: TextStyle(
                      color: Color(0xff88a5fc),
                      fontSize: 22.5,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: (){
                  controller.edit_visit();

                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: StaticColor.primarycolor,
                  ),
                  child: const Text(
                    "تعديل",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            // buildTextField("الحرارة",'38'),
            // buildTextField("الضغط",'طبيعي'),
            //
            // buildTextField("SPO2",'--'),
            // buildTextField("النبض",'70 بالدقيقة'),
            // buildTextField("القصة السريرية",' صداع , فقدان توازن'),
            //
            // buildTextField("الفحص السريري",'اختلال بالتوازن'),
            // buildTextField("السوابق لمرضية","السكري"),
            // buildTextField("التشخيص","صداع مزمن"),
            // buildTextField("العلاج",' مسكن'),
            //
            //
            // buildTextField("ملاحظات","--"),
            SizedBox(
              height: 40,
            ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       IconButton(
            //           onPressed: () {
            //             controller.showMyDialog();
            //           },
            //           icon: Icon(
            //             Icons.delete_outline,
            //             color: Colors.red,
            //             size: 50,
            //           )),
            //       SizedBox(
            //         width: 50,
            //       ),
            //       IconButton(
            //           onPressed: () {
            //             controller.EditVisi();
            //           },
            //           icon: Icon(
            //             Icons.check_circle_outline_outlined,
            //             color: Color(0xff9bb4fd),
            //             size: 50,
            //           ))
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String string, String string2) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
      // width: Get.width * 0.90,
      //  height: Get.height * 0.12,

      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        //controller: controller.textEditingController,
        textDirection: TextDirection.rtl,
        maxLines: null,
        textAlign: TextAlign.right,

        decoration: InputDecoration(
          labelText: '${string}',
          labelStyle: TextStyle(
              color: Color(0xff88a5fc),
              fontSize: 22.5,
              fontWeight: FontWeight.bold),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
