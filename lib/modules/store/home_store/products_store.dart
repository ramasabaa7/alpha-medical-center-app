import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Product_store {
  final String name;
  int quantity;
  String production_date ;
  String expiry_date ;
  int min;


  Product_store({required this.name, this.quantity = 0,this.production_date='',this.expiry_date='',this.min=0});
}