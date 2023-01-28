import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tester_app/features/set_password/api_setpassword.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerSetpassword extends GetxController{
  final ApiSetpassword api;
  ControllerSetpassword ({required this.api});

  final formkeySetpass = GlobalKey<FormState>();

  var edtNewPass = TextEditingController();
  var edtConfirmPass = TextEditingController();

  var showPass = true.obs;
  var showConfirmPass = true.obs;

  var loading = false.obs;

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtNewPass.dispose();
    edtConfirmPass.dispose();
  }

  validator()async{
    if(formkeySetpass.currentState!.validate()){
      newPass();
    }else{
      log('Please check input data');
    }
  }

  newPass()async{
    try{
      loading(true);
      var newPassResponse = await api.setPassword(
          id_user: controllerGlobalUser.user.value.idUser ?? 0,
          newPass: edtNewPass.text,
          confirmPass: edtConfirmPass.text
      );
      if(newPassResponse != null){
        log("Success");
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}