import 'package:flutter/material.dart';
import 'package:project_after_update/modules/reception/laboratory_in_reception/wating_in_laboratory_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Wating_in_laboratory extends StatelessWidget {
  const Wating_in_laboratory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Wating_in_laboratory_controller controller=Get.put(Wating_in_laboratory_controller());
    return Scaffold(
      body: GetBuilder<Wating_in_laboratory_controller>(builder: (controller){
        return
          Container(
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
                        ),
                    ),
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
                      "قسم الإستقبال",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            "assets/images/stopwatch.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "دور الإنتظار مركز ألفا الطبي",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 10,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: StaticColor.thirdgrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const ListTile(
                            title: Text(
                              " المريض : ${"سامر أحمد"} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(" الطبيب : ب"),
                            trailing: Text(
                              "2023-4-22 8:00 pm",
                              style: TextStyle(
                                  color: StaticColor.primarycolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.toNamed("/Laboratory_reserv");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: StaticColor.primarycolor,
                      ),
                      child: const Text(
                        "حجز",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed("/Laboratory_service_type",arguments: {
                        "id_section":controller.id_section
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: StaticColor.primarycolor,
                      ),
                      child: const Text(
                        "الخدمات",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),

            ]),
          );
      })
    );
  }
}
