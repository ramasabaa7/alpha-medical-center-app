import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdataview(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(color: StaticColor.primarycolor),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(
                child: Text("offlinefailure"),
              )
            : statusRequest == StatusRequest.serverfailure
                ? const Center(
                    child: Text("serverfailure"),
                  )
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text("nodata"),
                      )
                    : widget;
  }
}
