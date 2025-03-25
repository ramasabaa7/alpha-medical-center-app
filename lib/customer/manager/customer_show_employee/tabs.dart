import 'package:flutter/material.dart';
class Tabs extends StatelessWidget {
 late String image_bath;
   Tabs({Key? key,required this.image_bath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Tab(
        child: Container(
          height: 40,
          width: 60,
          child: Image.asset(
            image_bath,
            fit: BoxFit.cover,
          ),
        ),
      );
      ;
  }
}
