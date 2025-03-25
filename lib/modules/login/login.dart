import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/class/handlimgdataview.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/login/login_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Login_controller controller = Get.put(Login_controller());
    return Scaffold(
      body: SafeArea(child: GetBuilder<Login_controller>(builder: (controller) {
        return
            controller.statusRequest == StatusRequest.loading?
                Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
             Form(
              // key: controller.formstate3,
               child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: StaticColor.primarycolor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Image.asset(
                      "assets/images/Computer login-bro.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: StaticColor.thirdgrey.withAlpha(20),
                      ),
                      child:
                         Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "ادخل لحسابك",
                              style: TextStyle(
                                fontSize: 25,
                                color: StaticColor.blackcolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              validator: (val){
                                return validinput(val!,3,100,"username");
                              },

                              keyboardType: TextInputType.name,
                              onChanged: (val) {
                                controller.username = val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  label: const Text(
                                    " اسم المستخدم",
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
                            SizedBox(height: 5,),
                            TextFormField(
                              validator:(val){
                                return validinput(val!,3,100,"password");
                              },
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (val) {
                                controller.password = val;
                              },
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
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
                            GestureDetector(
                              onTap: () {
                                controller.login();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.height * 0.09,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: StaticColor.primarycolor,
                                ),
                                child: const Text(
                                  "طلب الدخول",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed("/signup");
                                },
                                child: Text(
                                  "ليس لديك حساب ؟ ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor),
                                ))
                          ],
                        ),

                  ),
                ],
            ),
             );
      })),
    );
  }
}
