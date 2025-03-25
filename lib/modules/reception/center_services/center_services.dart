import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Center_services extends StatelessWidget {
  const Center_services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColor.primarycolor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/laboratory_doctor.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    "assets/images/ray_doctor.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView(children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "تحاليل المركز",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Container(),
                          );
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: StaticColor.primarycolor,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    width: 200,
                                    child: Image.asset(
                                        "assets/images/clinic.png",
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    "تحليل T3",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "5000",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    )),
                                const Spacer(),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ]),
            ),
            Container(
              child: ListView(children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        " الصور الشعاعية",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Container(),
                          );
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: StaticColor.primarycolor,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    width: 200,
                                    child: Image.asset(
                                        "assets/images/clinic.png",
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    "تحليل T3",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "5000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const Spacer(),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
