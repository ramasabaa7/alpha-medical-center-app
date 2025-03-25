import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/storage_in_managment/storage_in_managment_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Storage_in_managment extends StatelessWidget {
  const Storage_in_managment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Storage_in_managment_controller controller =
    Get.put<Storage_in_managment_controller>(
        Storage_in_managment_controller());
    return DefaultTabController(
      length: 3,
      child: RefreshIndicator(
        onRefresh: ()async{
          controller.get_all_material_in_center();
          controller.get_all_type_of_section();
          controller.get_all_user();

        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: StaticColor.primarycolor,
            onPressed: (){
              Get.toNamed("/Add_service_type_for_reception",arguments: {
                "id_section":controller.section_id
              });
            },
            child: Icon(Icons.add_circle),
          ),
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
                      "assets/images/stock.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/images/storage.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/images/storage_emb.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
          GetBuilder<Storage_in_managment_controller>(builder: (controller){

            return
              controller.statusRequest==StatusRequest.loading?Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
              Container(
              child: ListView(
                  shrinkWrap: true,
                  children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "مواد المخزن",
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
                  height: MediaQuery.of(context).size.height*0.6,
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                                Container(color: Colors.white,child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0x4cffffff),
                                              ),
                                              child:Image.asset("assets/images/service_details.png")
                                          ),
                                          Text("تفاصيل المادة",style: TextStyle(fontSize: 16),),

                                        ],),
                                      Divider(),
                                      Text(" ${controller.data[index]['Quantity']} : الكمية   ",),
                                      Divider(),
                                      Text(" ${controller.data[index]['Lower_Limit']} : الحد الأدنى   ",),
                                      Divider(),
                                      Text(" ${controller.data[index]['UpperLimit']} : الحد الأعلى   ",),
                                      Divider(),
                                      // Text(" ${controller.data[index]['ProductionDate']} : تاريخ الإنتاج   ",),
                                      // Divider(),
                                      // Text(" ${controller.data[index]['ExpiryDate']} : تاريخ الإنتهاء   ",),

                                    ],),
                                )));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: StaticColor.thirdgrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                                Text(
                                  "اسم المنتج :  ${controller.data[index]['Name']} ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(" تاريخ الإنتاج  : ${controller.data[index]['created_at']}",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ]),
            );
          }),
            GetBuilder<Storage_in_managment_controller>(builder: (controller){
              return
              controller.statusRequest==StatusRequest.loading?
                  Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                Container(
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            " أنواع الخدمات",
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
                        itemCount: controller.data_type_section.length
                        ,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed("/Xray_center_services",arguments: {
                              //   "id_type" :controller.data[index]['id']
                              // });
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
                                            "assets/images/storage.png",
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "${controller.data_type_section[index]['Name']}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title:
                                                "هل تريد تعديل نوع هذه الخدمة  ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                        Get.toNamed("/Edit_service_type_reception",arguments: {
                                                          "id":controller.data_type_section[index]['id'],
                                                          "id_section":controller.data_type_section[index]['id_section']
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "نعم",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),

                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "لا",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),

                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                  "assets/images/pen.png"),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title: "هل تريد حذف هذه الخدمة ؟",
                                                content: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                        controller.delete_type(controller.data_type_section[index]['id']);
                                                        controller.data_type_section.removeAt(index);
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "نعم",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),

                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.all(5),
                                                        alignment: Alignment.center,
                                                        height: 50,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.2,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: StaticColor
                                                              .primarycolor,
                                                        ),
                                                        child: const Text(
                                                          "لا",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),

                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                  "assets/images/delete.png"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ]),
                );
            }),
              GetBuilder<Storage_in_managment_controller>(builder: (controller){
                return
                controller.statusRequest==StatusRequest.loading?
                    Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
                  Card(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data_user[0]['types_of_center_services'].length,
                          itemBuilder: (context,int){
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data_user[0]['types_of_center_services'][int]['user'].length,
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
                                                GestureDetector(
                                                  onTap: (){
                                                    Get.toNamed("/details_user",arguments: {
                                                      "id_user":controller.data_user[0]['types_of_center_services'][int]['user'][index]['id']
                                                    });
                                                  },
                                                  child: Container(
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

                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Row(children: [
                                                Text(
                                                  "${controller.data_user[0]['types_of_center_services'][int]['user'][index]['name']} ",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(width: 3,),
                                                Text(": الإسم",style: TextStyle(fontWeight: FontWeight.bold,color: StaticColor.primarycolor),)
                                              ],),
                                              //    const Text(" الإختصاص : ب",style: TextStyle(color: Colors.grey),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                    ),
                  );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
