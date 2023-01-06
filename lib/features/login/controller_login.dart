import 'dart:developer';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tester_app/api/api2.dart';
import 'package:tester_app/features/login/api_login.dart';
import 'package:tester_app/pages/app_routes.dart';
import 'package:tester_app/response/user.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerLogin extends GetxController{
  final ApiLogin api;
  ControllerLogin({required this.api});

  final formkeyLogin = GlobalKey<FormState>();

  var edtUsername = TextEditingController();
  var edtPassword = TextEditingController();
  var deviceInfo = DeviceInfoPlugin();
  var showPass = true.obs;
  var loading = false.obs;
  var platformVersion = ''.obs;

  var userControl = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    getDeviceinfo();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtUsername.dispose();
    edtUsername.dispose();
  }

  validator()async{
    if(formkeyLogin.currentState!.validate()){
      login();
    }else{
      log('Please check input data');
    }
  }

  getDeviceinfo()async{
    try{
      var meiInfo = await DeviceInformation.deviceIMEINumber;
      log(meiInfo.toString());
    }on PlatformException{
      platformVersion.value = 'FFailed to get platform version';
    }
  }

  login()async{
    try{
      loading(true);
      var loginResult = await api.signIn(
          username: edtUsername.text,
          password: edtPassword.text
      );
      if(loginResult["success"] == true){
        var userResponse = loginResult["data_user"];
        var userKeepResponse = User.fromJson(userResponse);
        userControl.user.value = userKeepResponse;
        await Api2().setUser(user: userKeepResponse.toJson());
        var userToken = loginResult["token"];
        await Api2().setToken(token: userToken);
        await Api2().setIsLogin(isLogin: true);
        Get.offNamed(Routes.main);
      }else{
        Fluttertoast.showToast(msg: "Akun tidak ditemukan");
      }
      loading(false);
    }catch(e){
      loading(false);
      Fluttertoast.showToast(msg: "Ada yang salah");
      log(e.toString());
    }
  }
}