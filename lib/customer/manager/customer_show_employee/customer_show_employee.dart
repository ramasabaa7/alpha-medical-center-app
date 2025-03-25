import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Customer_show_employee extends StatelessWidget {
  late String dep_name;
   Customer_show_employee({Key? key, required this.dep_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ListView(children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "قسم الإدارة",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Text(
                    "الموظفين" + " / " "${dep_name}",
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
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
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8)
                    ,
                    margin: const EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: StaticColor.thirdgrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                                    Container(
                                      height: 60,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Image.asset(
                                                "assets/images/service_details.png",
                                                fit: BoxFit.fill,
                                              )),
                                          const Expanded(child: Text("تفاصيل")),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 50,
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Image.asset(
                                                "assets/images/cancel.png",
                                                fit: BoxFit.fill,
                                              )),
                                          const Expanded(child: Text("إزالة")),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                              const Text(
                              " الإسم : ${"سامر أحمد"} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                             const Text(" الإختصاص : ب",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
