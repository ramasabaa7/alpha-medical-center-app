import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/financial_home/profile_info_finance/edit_profile_info_finance/edit_profile_info_finance_controller.dart';
import 'package:project_after_update/modules/manager/home/profile_info_managment/edit_profile_info_managment/edit_profile_info_managmenr_controller.dart';
import 'package:project_after_update/modules/reception/home/profile_info/edit_profile_info/edit_profile_info_controller.dart';
import 'package:project_after_update/modules/signup/signup_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class EDit_profile_info_finance extends StatelessWidget {
  Edit_profile_info_finance_controller controller = Get.put<Edit_profile_info_finance_controller>(Edit_profile_info_finance_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:    GestureDetector(
        onTap: (){
          controller.checkinput();
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: StaticColor.primarycolor,
          ),
          child: const Text(
            "تعديل",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
          child: GetBuilder<Edit_profile_info_finance_controller>(builder:(controller){
            return controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
            Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: StaticColor.primarycolor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Image.asset(
                      "assets/images/Privacy policy-rafiki(1).png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all(10),
                      //height: MediaQuery.of(context).size.height *1.02,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: StaticColor.thirdgrey.withAlpha(30),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "تعديل معلومات الحساب",
                            style: TextStyle(
                              fontSize: 20,
                              color:Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "يرجى إدخال المعلومات الجديدة",
                            style: TextStyle(
                              fontSize: 10,
                              color:Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              validator: (val){
                                return validinput(val!,3,100,"name");
                              },
                              keyboardType: TextInputType.name,
                              onChanged: (val) {
                                controller.name=val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label: const Text(
                                    "الاسم",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.person_2_outlined),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              validator: (val){
                                return validinput(val!,3,100,"username");
                              },
                              keyboardType: TextInputType.name,
                              onChanged: (val) {
                                controller.username=val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label: const Text(
                                    "اسم المستخدم",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.person_2_outlined),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              validator: (val){
                                return validinput(val!,3,100,"surname");
                              },
                              keyboardType: TextInputType.name,
                              onChanged: (val) {
                                controller.surname=val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label: const Text(
                                    "تاكيد الاسم",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.person_2_outlined),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              validator: (val){
                                return validinput(val!,3,100,"password");
                              },
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (val) {
                                controller.password=val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label: const Text(
                                    " كلمة المرور",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.lock_outline),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              validator: (val){
                                return validinput(val!,3,100,"password");
                              },
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (val) {
                                controller.pass_conf=val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label: const Text(
                                    "تأكيد كلمة المرور",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.lock_outline),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              validator: (val){
                                return validinput(val!,12,100,"email");
                              },
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {
                                controller.email=val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  label: const Text(
                                    " البريد الالكتروني",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  suffixIcon: const Icon(Icons.email_outlined),
                                  contentPadding: const EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                            ),
                          ),

                        ],
                      )),
                ],
              ),
            );
          })
      ),
    );
  }
}
