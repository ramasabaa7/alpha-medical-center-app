

import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../core/class/StatusRequest.dart';
import '../../../static_colors/StaticColors.dart';
import 'homelabController.dart';



class Type_serviclab extends StatelessWidget {
  final homelabController controller ;
  const Type_serviclab( {Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      controller.statusRequest == StatusRequest.loading?
    Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,)) :
    Flexible(
        child: ListView.builder(
            itemCount: controller.data_details.length ,
            itemBuilder: (BuildContext contex, int index) {
              return Listpatients(
                index: index ,
                controlar: controller,
              );
            }));
  }


}

class Listpatients extends StatelessWidget {


  final int index;
  final homelabController controlar ;
  const  Listpatients({Key? key, required this.index,required this.controlar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {


          Get.toNamed("/Listlab",arguments: {
            "id_typeofservic" : controlar.data_details[index]['id'],
            "name_ofservic" : controlar.data_details[index]['Name']
          });


        },
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

                Text('${controlar.data_details[index]['Name']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: 'Arial')),




              ],
            ),
          ),
        ),
      ),
    );
  }


}
