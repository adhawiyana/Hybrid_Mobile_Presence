import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/home/api_home.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerHome extends GetxController{
  final ApiHome api;
  ControllerHome({required this.api});

  var loading = false.obs;

  var locationSelected = 0.obs;
  var edtAct = TextEditingController();

  var lat = 0.0.obs;
  var long = 0.0.obs;

  var controllerGlobalUser = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    location();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtAct.dispose();
  }

  location()async{
    try{
      loading(false);
      var getLocationResponse = await api.getLocation();
      if(getLocationResponse != null){
        lat.value = getLocationResponse["location"][0]["latitude"];
        long.value = getLocationResponse["location"][0]["longitude"];
      }
      log(lat.value.toString());
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}