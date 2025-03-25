import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Product {
  final String name;
  int quantity;

  Product({required this.name, this.quantity = 0});
}