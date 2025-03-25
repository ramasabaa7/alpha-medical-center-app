import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/modules/Lab/Warehose/warehouseControllerlab.dart';
import 'package:project_after_update/modules/Nurse/warehouse/warehouseController.dart';

class ProductsinDepartment extends StatelessWidget {
  final Nurse_warehouseController controller ;
  const ProductsinDepartment({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: controller.data_details.length,
            itemBuilder: (BuildContext contex, int index) {
              return Products(
                index: index,
                controller: controller,
              );
            }));
  }
}

class Products extends StatelessWidget {
  final int index;
  final Nurse_warehouseController controller ;
  const Products({Key? key, required this.index,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${controller.data_details[index]['Quantity']} ',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 13,color: Colors.black54,
                  ),

                ),
                Text(
                  'العدد',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 13,color: Colors.black54,
                  ),

                ),
                Text('${controller.data_details[index]['Name']} ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),
                IconButton(
                  color: Color(0xffb3c6ff),
                  icon: Icon(
                    Icons.medical_information_outlined,
                    size: 30,
                  ),
                  onPressed: () {
                    //   itemDetailsController.add()

                  },
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}