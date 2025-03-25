import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_after_update/modules/reception/doctors/doctors_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Doctors extends StatelessWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Doctors_controller controller=Get.put<Doctors_controller>(Doctors_controller());
    return Scaffold(
      body: Container(
        child: ListView(children: [
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "أطباء المركز",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "مركز ألفا الطبي",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Divider(
                  height: 10,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed("/doctors_details");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: StaticColor.thirdgrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: const Text(
                          "اسم الطبيب : سامر أحمد ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(" العيادة : القلبية"),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit_calendar_outlined),
                          onPressed: () {
                            Get.bottomSheet(
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  const Text(
                                    "تعديل المواعيد",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.45,
                                    padding: const EdgeInsets.all(8),
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ListTile(
                                            trailing: const Text("أيام العمل"),
                                            subtitle:DropDownMultiSelect(
                                              options:controller.options,
                                              whenEmpty: "إختر أيام العمل",
                                              onChanged: (value){
                                                controller.selectedoptionlist.value=value;
                                                controller.selectedoption.value="";
                                                controller.selectedoptionlist.value.forEach((element) {
                                                  controller.selectedoption.value=controller.selectedoption.value+" " +element;
                                                });
                                              },
                                              selectedValues:controller.selectedoptionlist.value,
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          ListTile(
                                            trailing: const Text("ساعات العمل"),
                                            subtitle:DropDownMultiSelect(
                                              options:controller.options_houer,
                                              whenEmpty: "إختر ساعات العمل",
                                              onChanged: (value){
                                                controller.selectedoptionlist_houer.value=value;
                                                controller.selectedoption_houer.value="";
                                                controller.selectedoptionlist_houer.value.forEach((element) {
                                                  controller.selectedoption_houer.value=controller.selectedoption_houer.value+" " +element;
                                                });
                                              },
                                              selectedValues:controller.selectedoptionlist_houer.value,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: MediaQuery.of(context).size.width*0.3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: StaticColor.primarycolor,
                                            ),
                                            child: const Text("تأكيد",style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            );
                          },
                          color: StaticColor.primarycolor,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
