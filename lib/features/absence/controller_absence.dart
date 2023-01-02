import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tester_app/features/absence/api_absence.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

import '../../response/detail_track.dart';

class ControllerAbsence extends GetxController{
  final ApiAbsence api;
  ControllerAbsence ({required this.api});

  var loading = false.obs;
  var edtAct = TextEditingController();

  var currLocation = ''.obs;
  var currrTimeArr = ''.obs;
  var currPost  = ''.obs;

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    super.onInit();
    currentPresence();
  }

  @override
  void onClose() {
    super.onClose();
    edtAct.dispose();
  }

  currentPresence()async{
    try{
      loading(true);
      var currentPresenceResponse = await api.todayPresence(
          DateFormat("yyyy-MM-dd").format(DateTime.now()),
          controllerGlobalUser.user.value.idUser ?? 0
      );
      if(currentPresenceResponse != null){
        var response = currentPresenceResponse["detail"];
        var responseKeeper = DetailTrack.fromJson(response);
        currLocation.value = responseKeeper.location ?? "-";
        currrTimeArr.value = responseKeeper.arrivetime ?? "--:--";
        currPost.value = responseKeeper.post ?? "-";
      }
      log(currrTimeArr.value);
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}