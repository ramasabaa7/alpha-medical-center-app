
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/manager/home/home_manager_controller.dart';
import 'package:project_after_update/modules/reception/home/home_reception_controller.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/patient_details_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Home_reception extends StatelessWidget {
  const Home_reception({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Home_reception_controller controller =Get.put(Home_reception_controller());
    return RefreshIndicator(
      onRefresh: ()async{
        await controller.get_all_section();
      },
      child: SafeArea(
          child: GetBuilder<Home_reception_controller>(builder: (controller){
            return
              controller.statusRequest==StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
              Container(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                validator: (val){
                                  return validinput(val!, 14,14,"idpersonal");
                                },
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  controller.id_patient=value ;
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                    prefixIcon: GestureDetector(child: const Icon(Icons.search),onTap: (){
                                            controller.checkinput();
                                    },),
                                    hintText: "أدخل الرقم الوطني",
                                    hintStyle: const TextStyle(fontSize: 15,color: Colors.grey),
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
                            child:
                            IconButton(
                              onPressed: () {
                                Get.toNamed("/All_employee_reception");
                              },
                              icon: const Icon(
                                Icons.work,
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
                        children:  [
                          Text(
                            "قسم الإستقبال",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
                          ),
                          Container(
                            color: StaticColor.primarycolor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:70,
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
                          Container(
                            height: MediaQuery.of(context).size.height*0.6,
                            child: GridView.builder(
                              itemCount: controller.data.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (context,index){
                                return
                                  GestureDetector(
                                    onTap: () {
                                      if(controller.data[index]['Name']=='clinic'){
                                        Get.toNamed("/clinics",arguments: {
                                          "id_section":controller.data[index]['id']
                                        }
                                        );
                                      }else if(controller.data[index]['Name']=='xray'){
                                        Get.toNamed("/Xray_service_type",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='Laboratory'){
                                        Get.toNamed("/Laboratory_service_type",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='Store'){
                                     //   Get.toNamed("/Storage_in_managment");
                                      }

                                    },
                                    child: Container(
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                      // width: MediaQuery.of(context).size.width * 0.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: StaticColor.primarycolor,
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child:
                                              controller.data[index]['Name']=='clinic'?
                                              Image.asset(
                                                  "assets/images/Body anatomy-rafiki.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='xray'?
                                              Image.asset(
                                                  "assets/images/Rheumatology-pana.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Laboratory'?
                                              Image.asset(
                                                  "assets/images/Laboratory-bro.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Store'?
                                              Image.asset(
                                                  "assets/images/storage.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Reception'?
                                              Image.asset(
                                                  "assets/images/reception.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Finance'?
                                              Image.asset(
                                                  "assets/images/finance.png",
                                                  fit: BoxFit.fill) :
                                              controller.data[index]['Name']=='Ambulance'?
                                              Image.asset(
                                                  "assets/images/Ambulance-section.png",
                                                  fit: BoxFit.fill):
                                            Image.asset(
                                            "assets/images/logo.png",
                                            fit: BoxFit.fill),
                                            ),
                                            Expanded(
                                                child:
                                                controller.data[index]['Name']=='clinic'?
                                                Text(
                                                  "العيادات",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ):
                                                controller.data[index]['Name']=='xray'?
                                                Text(
                                                  "الأشعة",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ):
                                                controller.data[index]['Name']=='Laboratory'?
                                                Text(
                                                  "المخبر",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Store'?
                                                Text(
                                                  "المخزن",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Reception'?
                                                Text(
                                                  "الإستقبال",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Finance'?
                                                Text(
                                                  "المالية",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                Text(
                                                  "${controller.data[index]['Name']}",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                )
                                            )
                                          ],
                                        )),
                                  );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
          })
      ),
    );
  }
}
