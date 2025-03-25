import 'package:flutter/material.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Patient_Visits_in_managment extends StatelessWidget {
  const Patient_Visits_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              clipBehavior:Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      color: StaticColor.primarycolor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                ),
                Positioned(
                  top:90,
                  left: 130,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.asset("assets/images/patient_profile.png"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "قسم الإدارة",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        child: Image.asset("assets/images/information.png",fit: BoxFit.fill,),
                      ),
                      const Text(
                        "زيارات المريض",
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
              height: MediaQuery.of(context).size.height*0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.builder(itemCount:10,itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.09,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                    color:StaticColor.thirdgrey,
                    border: Border(
                      bottom: BorderSide(
                          color: StaticColor.primarycolor,
                          width:0.5
                      ),
                      left: BorderSide(
                          color: StaticColor.primarycolor,
                          width:0.5
                      ),
                    ),
                  ),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset("assets/images/info.png",fit: BoxFit.fill,),
                            height: 40,
                            width: 40,
                          ),
                          Text("2020-7-5",style: TextStyle(color: StaticColor.primarycolor),)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );

  }
}
