import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tester_app/features/absence_success/api_absencesuccess.dart';
import 'package:tester_app/response/detail_track.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerAbsenceSuccess extends GetxController{
  final ApiAbsenceSuccess api;
  ControllerAbsenceSuccess({required this.api});

  var loading = false.obs;
  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  var detail = DetailTrack().obs;

  @override
  void onInit() {
    super.onInit();
    detailResponse();
  }

  detailResponse()async{
    try{
      loading(true);
      var detailResponse = await api.detailTrack(
          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
          id_user: controllerGlobalUser.user.value.idUser ?? 0);
      if(detailResponse != null){
        var detailsKeeper = detailResponse["detail"];
        detail.value = DetailTrack.fromJson(detailsKeeper);
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}