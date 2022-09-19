import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/set_password/api_setpassword.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerSetpassword extends GetxController{
  final ApiSetpassword api;
  ControllerSetpassword ({required this.api});

  final formkeySetpass = GlobalKey<FormState>();

  var edtcurrPassword = TextEditingController();
  var edtNewPassword = TextEditingController();

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtcurrPassword.dispose();
    edtNewPassword.dispose();
  }

  validator()async{
    if(formkeySetpass.currentState!.validate()){
      Get.back();
      log('Success!');
    }else{
      log('Please check input data');
    }
  }
}