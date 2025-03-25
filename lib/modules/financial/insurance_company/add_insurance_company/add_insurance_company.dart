import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/insurance_company/add_insurance_company/add_insurance_company_controller.dart';
import 'package:project_after_update/modules/manager/home/recption_in_managment/add_service_type_for_reception/add_serive_type_rec_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Add_insurance_company extends StatelessWidget {
  const Add_insurance_company({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Add_insurance_company_controller controller =
    Get.put<Add_insurance_company_controller>(Add_insurance_company_controller());
    return Scaffold(
        body: GetBuilder<Add_insurance_company_controller>(builder: (controller){
          return
            Container(
              child: ListView(
                children: [
                  Container(
                    height: 115,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: StaticColor.primarycolor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //   margin: EdgeInsets.only(left: 10),
                          //  height:100,
                          // width: 100,
                          child: Image.asset(
                            "assets/images/Insurance-pana.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: const [
                              Text(
                                "مركز ألفا الطبي",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "جميع الإختصاصات الطبية",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "إسعاف - مخبر - أشعة",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: controller.formstate,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            " إضافة شركة تأمين جديدة",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.black45,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 3,100,"idpersonal");
                            },
                            onChanged: (val) {
                              controller.name=val;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label: const Text(
                                  "اسم شركة التأمين",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: Icon(Icons.filter_list_alt,size: 30,),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 1,25,"idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.IN=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "IN",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: const Icon(Icons.credit_card_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 1,25,"idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.AMB=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "AMB",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: const Icon(Icons.credit_card_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 1,25,"idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.PM=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "PM",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: const Icon(Icons.credit_card_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            validator: (val){
                              return validinput(val!, 1,25,"idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.DV=value ;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                label:  const Text(
                                  "DV",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon: const Icon(Icons.credit_card_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          Divider(),
                          SizedBox(height: 10,),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                controller.checkinput();

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
                                  "تأكيد",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        })
    );
  }
}
