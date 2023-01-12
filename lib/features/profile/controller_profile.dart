import 'dart:developer';
import 'package:get/get.dart';
import 'package:tester_app/features/profile/api_profile.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerProfile extends GetxController{
  final ApiProfile api;
  ControllerProfile({required this.api});

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  var loading = false.obs;

  var onsiteData = 0.obs;
  var offsiteData = 0.obs;

  @override
  void onInit() {
    super.onInit();
    onsiteExe();
    offsiteExe();
  }

  onsiteExe()async{
    try{
      loading(true);
      var onsiteResponse = await api.onsiteTrack(id_user: controllerGlobalUser.user.value.idUser ?? 0);
      if(onsiteResponse["data"] != 0){
        onsiteData.value = onsiteResponse["data"];
      }
      log(onsiteResponse["data"].toString());
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }

  offsiteExe()async{
    try{
      loading(true);
      var offsiteResponse = await api.offsiteTrack(id_user: controllerGlobalUser.user.value.idUser ?? 0);
      if(offsiteResponse["data"] != 0){
        offsiteData.value = offsiteResponse["data"];
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}