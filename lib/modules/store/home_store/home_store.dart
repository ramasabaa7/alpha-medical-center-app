import 'package:flutter/material.dart';
import 'package:project_after_update/modules/store/home_store/warehouseControllerstor.dart';
import 'package:project_after_update/modules/store/home_store/warehouseProductsstore.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class home_store extends StatelessWidget {
  home_store({Key? key}) : super(key: key);
  warehouseControllerstor controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<warehouseControllerstor>(builder: (controller) {
       return Scaffold(
        body:
        SafeArea(
         child: Column(
         children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "البحث",
                      hintStyle: const TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.grey[200]),
                )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: StaticColor.primarycolor,
                  ),
                  width: 60,
                  height: 55,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                    onPressed: () {
                      _increment_requrst_SalaryDialog();
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: StaticColor.primarycolor,
                  ),
                  width: 60,
                  height: 55,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    icon: const Icon(
                      Icons.login_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "المستودع",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "مركز ألفا الطبي",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.black45,
                  ),
                  const Text(
                    "المحتويات",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                ],
              )),
           Expanded(
             child: warehouseProducts(),
             flex: 1,
           ),
           GestureDetector(
             onTap: () {
               Get.toNamed('/add_Details');

             },
             child: Align(
               alignment: Alignment.bottomLeft,
               child: Container(
                 width: 160,
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
                           Icons.add,
                           color: Colors.white,
                         ),


                         SizedBox(width: 10),
                         Text(
                           ' إضافة مادة',
                           style: TextStyle(
                             fontSize: 20,
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
    ));
  });
}
  void _increment_requrst_SalaryDialog() {
    warehouseControllerstor controller = Get.find();
    Get.defaultDialog(
      title: ' طلب زيادة راتب ',
      content: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: TextFormField(
              onChanged: (val) {
                controller.detaile = val;
              },
              decoration: InputDecoration(labelText: 'أدخل تفاصيل الطلب'),
              maxLines: 3,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
          ),
          child: Text('إلغاء'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff9bb4fd)),
          ),
          onPressed: () {
            controller.increment_requrst_Salary();
            Get.back();
          },
          child: Text('إرسال الطلب'),
        ),
      ],
    );
  }

}
