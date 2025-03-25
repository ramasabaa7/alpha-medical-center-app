import 'package:flutter/material.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Custom_Drawer extends StatelessWidget {
  const Custom_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "طلبات المستهلكات",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                color: StaticColor.primarycolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 100,
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: const Text(
                        " مركز ألفا الطبي",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                color: Colors.black45,
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: StaticColor.thirdgrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2023-7-1",
                              style: TextStyle(color: StaticColor.primarycolor),
                            ),
                            Text(
                              "اسم المستهلك :  قطن ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "المرسل  : قسم المستودع",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "المستقبل  : قسم العيادات",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "الكمية  : 5 ",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
