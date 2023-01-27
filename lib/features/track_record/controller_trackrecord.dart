import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tester_app/features/track_record/api_trackrecord.dart';
import 'package:tester_app/response/track_record.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

import '../../pages/app_routes.dart';
import '../../response/detail_track.dart';

class ControllerTrackrecord extends GetxController{
  final ApiTrackrecord api;
  ControllerTrackrecord({required this.api});

  var loading = false.obs;

  var date_one = DateTime.now().obs;
  var date_two = DateTime.now().obs;

  var detail = DetailTrack().obs;

  RxList<TrackRecordResponse> trackRecordList = <TrackRecordResponse>[].obs;

  ControllerGlobalUser controllerGlobalUser = Get.find<ControllerGlobalUser>();

  @override
  void onInit() {
    super.onInit();
  }

  selectedDateOne(context)async{
    var selectDate = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050),
        context: context
    );

    selectDate != null ? date_one.value = selectDate : date_one.value = DateTime.now();
  }

  selectedDateTwo(context)async{
    var selectDate = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050),
        context: context
    );

    selectDate != null ? date_two.value = selectDate : date_two.value = DateTime.now();
  }

  trackRecord()async{
    try{
      loading(true);
      var trackRecordResponse = await api.trackRecord(
          id_user: controllerGlobalUser.user.value.idUser ?? 0,
          date_one: DateFormat('yyyy-MM-dd').format(date_one.value),
          date_two: DateFormat('yyyy-MM-dd').format(date_two.value)
      );
      if(trackRecordResponse["Total"] != 0){
        var list = trackRecordResponse["Trackrecord"];
        trackRecordList(RxList<TrackRecordResponse>.from(list.map((e)=> TrackRecordResponse.fromJson(e))));
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }

  detailResponse(DateTime date)async{
    try{
      loading(true);
      var detailResponse = await api.detailTrack(
          date: DateFormat("yyyy-MM-dd").format(date),
          id_user: controllerGlobalUser.user.value.idUser ?? 0);
      if(detailResponse != null){
        var detailsKeeper = detailResponse["detail"];
        detail.value = DetailTrack.fromJson(detailsKeeper);
        Get.toNamed(Routes.detail_track_record);
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}