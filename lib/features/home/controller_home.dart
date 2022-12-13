import 'dart:developer' as log;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:tester_app/features/home/api_home.dart';
import 'package:tester_app/shared/controller/controller_global_user.dart';

class ControllerHome extends GetxController {
  final ApiHome api;

  ControllerHome({required this.api});

  var loading = false.obs;
  var locationSwitch = true.obs;

  var locationSelected = 0.obs;
  var edtAct = TextEditingController();

  var lat = 0.0.obs;
  var long = 0.0.obs;

  var dateTime = DateTime.now();
  var liveLat = 0.0.obs;
  var liveLng = 0.0.obs;
  var date = "".obs;
  var checkinTime = "".obs;

  var distance = 0.0.obs;

  var controllerGlobalUser = Get.find<ControllerGlobalUser>();

  Location locationService = Location();

  @override
  void onInit() async {
    location();
    locationPermit();
    locationListen();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtAct.dispose();
  }

  location() async {
    try {
      loading(false);
      var getLocationResponse = await api.getLocation();
      if (getLocationResponse != null) {
        lat.value = getLocationResponse["location"][0]["latitude"];
        long.value = getLocationResponse["location"][0]["longitude"];
      }
      loading(false);
    } catch (e) {
      loading(false);
      log.log(e.toString());
    }
  }

  locationPermit() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationService.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await locationService.getLocation();
  }

  locationListen() {
    locationService.onLocationChanged.listen((LocationData currentLocation) {
      liveLat.value = currentLocation.latitude!;
      liveLng.value = currentLocation.longitude!;
      log.log("lat => ${liveLat.value} + lng => ${liveLng.value}");
    });
  }

  locationDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    // return 12742 * asin(sqrt(a));
    distance.value = 1000 * 12742 * asin(sqrt(a));
  }

  checkin(String location)async{
    date.value = DateFormat("yyyy-MM-dd").format(dateTime);
    checkinTime.value = DateFormat("HH:mm:ss").format(dateTime);
    try{
      var presenceResponse = await api.presence(
          edtAct.text,
          date.value,
          checkinTime.value,
          "00:00:00",
          liveLat.value,
          liveLng.value,
          location,
          controllerGlobalUser.user.value.idUser ?? 0
      );
    }catch(e){}
  }
}