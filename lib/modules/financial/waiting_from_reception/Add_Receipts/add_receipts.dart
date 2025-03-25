import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/financial/waiting_from_reception/Add_Receipts/add_receipts_controller.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/visit_ergisteration/visit_register_in_reception_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Add_receipts extends StatelessWidget {
  const Add_receipts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Add_receipts_controller controller = Get.put(Add_receipts_controller());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: StaticColor.primarycolor,
          ),
          body: GetBuilder<Add_receipts_controller>(builder: (controller) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "تسجيل وصل دفع",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 60,
                              child: Image.asset("assets/images/receipt.png"),
                            ),
                            const Text(
                              "قسم المالية",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 10,
                          color: Colors.black45,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(20),
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      key: controller.formstate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            validator: (val) {
                              return validinput(val!, 1, 14, "idpersonal");
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.price = value;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                label: const Text(
                                  "المبلغ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon:
                                    const Icon(Icons.credit_card_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            validator: (val) {
                              return validinput(val!, 2, 100, "idpersonal");
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              controller.details = value;
                            },
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                label: const Text(
                                  "التفاصيل",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: StaticColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffixIcon:
                                    const Icon(Icons.credit_card_outlined),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
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
                                  "تسجيل",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
