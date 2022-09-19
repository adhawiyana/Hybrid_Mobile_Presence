import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/absence/api_absence.dart';

class ControllerAbsence extends GetxController{
  final ApiAbsence api;
  ControllerAbsence ({required this.api});

  var locationSelected = 0.obs;
  var edtAct = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtAct.dispose();
  }
}