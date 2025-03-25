import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/signup/signup_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Signup extends StatelessWidget {
  SignupController controller = Get.put<SignupController>(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignupController>(builder:(controller){
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
                    "assets/images/Sign up-amico.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height *1.02,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: StaticColor.thirdgrey.withAlpha(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "تسجيل حساب",
                          style: TextStyle(
                            fontSize: 25,
                            color: StaticColor.blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
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
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            validator: (val){
                              return validinput(val!,3,100,"name");
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
                          margin: EdgeInsets.only(bottom: 10),
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
                          margin: EdgeInsets.only(bottom: 10),
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
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            validator: (val){
                              return validinput(val!,3,100,"conf_pass");
                            },
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (val) {
                              controller.conf_pass=val;
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
                          margin: EdgeInsets.only(bottom: 10),
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
                        GetBuilder<SignupController>(builder: (controller) {
                          return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: StaticColor.thirdgrey.withAlpha(20),
                                borderRadius: BorderRadius.circular(20),
                                border: Border(
                                  top: BorderSide(
                                      width: 1, color: Colors.black.withAlpha(80)),
                                  right: BorderSide(
                                      width: 1, color: Colors.black.withAlpha(80)),
                                  left: BorderSide(
                                      width: 1, color: Colors.black.withAlpha(80)),
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black.withAlpha(80)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButton(

                                    items: controller.data_service_to_show
                                        .map((e) => DropdownMenuItem(
                                      child: Text("$e"),
                                      value: e,
                                    ))
                                        .toList(),
                                    onChanged: (val) {
                                      controller.changedepartment(val as String);
                                      controller.type=val;
                                       controller.selected = val.toString();
                                      print(controller.selected);
                                    },
                                   // value: controller.selected,

                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: StaticColor.blackcolor,
                                        fontWeight: FontWeight.bold),
                                    hint: Text("${controller.selected}"),
                                  ),
                                  const Icon(Icons.work_outline_outlined,
                                      color: StaticColor.blackcolor),
                                ],
                              ));
                        }),
                        GestureDetector(
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
                              "إنشاء حساب",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
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
